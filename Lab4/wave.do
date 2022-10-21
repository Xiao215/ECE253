# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog part2.sv

#load simulation using mux as the top level simulation module
vsim part2.sv

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

# first test case
#set input values using the force command, signal names need to be in {} brackets
force {Reset_b} 1
force {Data} 4'b1111
force {Function} 3'b000
force {Clock} 0
force {Clock} 1
#ALUout should be 00001111
# B should be 1111
#run simulation for a few ns
run 10ns

#second test case, change input values and run for another 10ns
# SW[0] should control LED[0]
#run fucntion again
force {Reset_b} 0
force {Clock} 0
force {Clock} 1
# should be 00011110
run 10ns

#third test case, change input values and run for another 10ns
# SW[0] should control LED[0]