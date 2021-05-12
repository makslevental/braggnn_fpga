package tensor

import chisel3.util.log2Ceil

// taken from https://github.com/vta.roject/rocket-chip

abstract class Field[T] private(val default: Option[T]) {
    def this() = this(None)

    def this(default: T) = this(Some(default))
}

abstract class View {
    final def apply[T](pname: Field[T]): T = apply(pname, this)

    final def apply[T](pname: Field[T], site: View): T = {
        val out = find(pname, site)
        require(out.isDefined, s"Key ${pname} is not defined in Parameters")
        out.get
    }

    final def lift[T](pname: Field[T]): Option[T] = lift(pname, this)

    final def lift[T](pname: Field[T], site: View): Option[T] =
        find(pname, site).map(_.asInstanceOf[T])

    def find[T](pname: Field[T], site: View): Option[T]
}

abstract class Parameters extends View {
    final def alter(
                     f: (View, View, View) => PartialFunction[Any, Any]): Parameters =
        Parameters(f) ++ this

    final def alterPartial(f: PartialFunction[Any, Any]): Parameters =
        Parameters((_, _, _) => f) ++ this

    final def ++(x: Parameters): Parameters =
        new ChainParameters(this, x)

    final def alterMap(m: Map[Any, Any]): Parameters =
        new MapParameters(m) ++ this

    def chain[T](site: View,
                 tail: View,
                 pname: Field[T]): Option[T]

    def find[T](pname: Field[T], site: View) =
        chain(site, new TerminalView, pname)
}

object Parameters {
    def empty: Parameters = new EmptyParameters

    def apply(f: (View, View, View) => PartialFunction[Any, Any]): Parameters =
        new PartialParameters(f)
}

class Config(p: Parameters) extends Parameters {
    def this(f: (View, View, View) => PartialFunction[Any, Any]) =
        this(Parameters(f))

    override def toString = this.getClass.getSimpleName

    def toInstance = this

    def chain[T](site: View, tail: View, pname: Field[T]) =
        p.chain(site, tail, pname)
}

// Internal implementation:

private class TerminalView extends View {
    def find[T](pname: Field[T], site: View): Option[T] = pname.default
}

private class ChainView(head: Parameters, tail: View) extends View {
    def find[T](pname: Field[T], site: View) = head.chain(site, tail, pname)
}

private class ChainParameters(x: Parameters, y: Parameters) extends Parameters {
    def chain[T](site: View, tail: View, pname: Field[T]) =
        x.chain(site, new ChainView(y, tail), pname)
}

private class EmptyParameters extends Parameters {
    def chain[T](site: View, tail: View, pname: Field[T]) = tail.find(pname, site)
}

private class PartialParameters(
                                 f: (View, View, View) => PartialFunction[Any, Any])
  extends Parameters {
    def chain[T](site: View, tail: View, pname: Field[T]) = {
        val g = f(site, this, tail)
        if (g.isDefinedAt(pname)) Some(g.apply(pname).asInstanceOf[T])
        else tail.find(pname, site)
    }
}

private class MapParameters(map: Map[Any, Any]) extends Parameters {
    def chain[T](site: View, tail: View, pname: Field[T]) = {
        val g = map.get(pname)
        if (g.isDefined) Some(g.get.asInstanceOf[T]) else tail.find(pname, site)
    }
}

/** Core parameters */
case class CoreParams(
                       batch: Int = 1,
                       blockOut: Int = 16,
                       blockIn: Int = 16,
                       inpBits: Int = 8,
                       wgtBits: Int = 8,
                       uopBits: Int = 32,
                       accBits: Int = 32,
                       outBits: Int = 8,
                       uopMemDepth: Int = 512,
                       inpMemDepth: Int = 512,
                       wgtMemDepth: Int = 512,
                       accMemDepth: Int = 512,
                       outMemDepth: Int = 512,
                       instQueueEntries: Int = 32
                     ) {
    require(uopBits % 8 == 0,
        s"\n\n[VTA] [CoreParams] uopBits must be byte aligned\n\n")
}

case object CoreKey extends Field[CoreParams]

case class AXIParams(
                      coherent: Boolean = false,
                      idBits: Int = 1,
                      addrBits: Int = 32,
                      dataBits: Int = 64,
                      lenBits: Int = 8,
                      userBits: Int = 1
                    ) {
    require(addrBits > 0)
    require(dataBits >= 8 && dataBits % 2 == 0)

    val strbBits = dataBits / 8
    val sizeBits = 3
    val burstBits = 2
    val lockBits = 2
    val cacheBits = 4
    val protBits = 3
    val qosBits = 4
    val regionBits = 4
    val respBits = 2
    val sizeConst = log2Ceil(dataBits / 8)
    val idConst = 0
    val userConst = if (coherent) 1 else 0
    val burstConst = 1
    val lockConst = 0
    val cacheConst = if (coherent) 15 else 3
    val protConst = if (coherent) 4 else 0
    val qosConst = 0
    val regionConst = 0
}

case class VCRParams() {
    val nCtrl = 1
    val nECnt = 1
    val nVals = 1
    val nPtrs = 6
    val nUCnt = 1
    val regBits = 32
}

/** VME parameters.
 *
 * These parameters are used on VME interfaces and modules.
 */
case class VMEParams() {
    val nReadClients: Int = 5
    val nWriteClients: Int = 1
    require(nReadClients > 0,
        s"\n\n[VTA] [VMEParams] nReadClients must be larger than 0\n\n")
    require(
        nWriteClients == 1,
        s"\n\n[VTA] [VMEParams] nWriteClients must be 1, only one-write-client support atm\n\n")
}

/** Shell parameters. */
case class ShellParams(
                        hostParams: AXIParams,
                        memParams: AXIParams,
                        vcrParams: VCRParams,
                        vmeParams: VMEParams
                      )

case object ShellKey extends Field[ShellParams]


/** CoreConfig.
 *
 * This is one supported configuration for VTA. This file will
 * be eventually filled out with class configurations that can be
 * mixed/matched with Shell configurations for different backends.
 */
class CoreConfig extends Config((site, here, up) => {
    case CoreKey =>
        CoreParams(
            batch = 1,
            blockOut = 16,
            blockIn = 16,
            inpBits = 8,
            wgtBits = 8,
            uopBits = 32,
            accBits = 32,
            outBits = 8,
            uopMemDepth = 2048,
            inpMemDepth = 2048,
            wgtMemDepth = 1024,
            accMemDepth = 2048,
            outMemDepth = 2048,
            instQueueEntries = 512
        )
})

/** PynqConfig. Shell configuration for Pynq */
class PynqConfig extends Config((site, here, up) => {
    case ShellKey =>
        ShellParams(
            hostParams = AXIParams(coherent = false,
                addrBits = 16,
                dataBits = 32,
                lenBits = 8,
                userBits = 1),
            memParams = AXIParams(coherent = true,
                addrBits = 32,
                dataBits = 64,
                lenBits = 8,
                userBits = 1),
            vcrParams = VCRParams(),
            vmeParams = VMEParams()
        )
})

class TestConfig extends Config(new CoreConfig ++ new PynqConfig)