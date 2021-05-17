package matmul

import chisel3._

class Conv(inChannels: Int, inHeight: Int, inWidth: Int, nFilters: Int,
           kHeight: Int, kWidth: Int, bitWidth: Int, stride: Int = 1, padding: Int = 0
          ) extends Module {
    val outHeight = (inHeight + padding - kHeight) / stride + 1
    val outWidth = (inWidth + padding - kWidth) / stride + 1
    val io = IO(new Bundle {
        val in = Input(Vec(inChannels, Vec(inHeight, Vec(inWidth, SInt(bitWidth.W)))))
        val kernel = Input(Vec(nFilters, Vec(inChannels, Vec(kHeight, Vec(kWidth, SInt(bitWidth.W))))))
        val out = Output(Vec(nFilters, Vec(outHeight, Vec(outWidth, SInt(bitWidth.W)))))
    })

    //    for filter in 0..num_filters
    //    for channel in 0..input_channels
    //    for out_h in 0..output_height
    //    for out_w in 0..output_width
    //    for k_h in 0..kernel_height
    //    for k_w in 0..kernel_width
    //    output[filter, out_h, out_w] +=
    //      kernel[filter, channel, k_h, k_w] *
    //        input[channel, out_h + k_h, out_w + k_w]

    val p = 10

    for (f <- 0 until nFilters) {
        for (c <- 0 until inChannels) {
            for (oH <- 0 until outHeight) {
                for (oW <- 0 until outWidth) {
                    //                    io.out(f)(oH)(oW) :=
                }
            }
        }
    }


}

