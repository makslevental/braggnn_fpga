set -e

#sbt 'runMain systolic.Im2Col --target-dir verilog'
#sbt 'runMain matmul.ComplexMatrixMatrixProduct --target-dir verilog'
#sbt 'runMain systolic.WSMatMul --target-dir verilog'
#sbt 'runMain systolic.OSMatMul --target-dir verilog'
#sbt 'runMain systolic.WSProcElem --target-dir verilog'
#sbt 'runMain systolic.OSProcElem --target-dir verilog'

rm verilog/*.json
rm verilog/*.fir
