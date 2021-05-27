set -e

#sbt 'runMain systolic.Im2Col --target-dir verilog'
sbt 'runMain systolic.WSMatMul --target-dir verilog'
#sbt 'runMain systolic.WSProcElem --target-dir verilog'

