import io
import random

import pyrtl

# # "pin" input/outputs
# a = pyrtl.Input(8, 'a')
# b = pyrtl.Input(8, 'b')
# q = pyrtl.Output(8, 'q')
# gt5 = pyrtl.Output(1, 'gt5')
#
# sum = a + b  # makes an 8-bit adder
# q <<= sum  # assigns output of adder to out pin
# gt5 <<= sum > 5  # does a comparison, assigns that to different pin

pyrtl.reset_working_block()

zero = pyrtl.Input(1, "zero")
counter_output = pyrtl.Output(3, "counter_output")
counter = pyrtl.Register(3, "counter")
counter.next <<= pyrtl.mux(zero, counter + 1, 0)
counter_output <<= counter

print("--- PyRTL Representation ---")
print(pyrtl.working_block())
print()

print("--- Verilog for the Counter ---")
with io.StringIO() as vfile:
    pyrtl.output_to_verilog(vfile)
    print(vfile.getvalue())

print("--- Simulation Results ---")
sim_trace = pyrtl.SimulationTrace([counter_output, zero])
sim = pyrtl.Simulation(tracer=sim_trace)
for cycle in range(15):
    sim.step({"zero": random.choice([1, 0, 0, 1])})
sim_trace.render_trace()
