vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../base_sequence.srcs/sources_1/ip/scramble_sequence_0/scamble_sequence.srcs/sources_1/new/scramble_sequence.v" \
"../../../../base_sequence.srcs/sources_1/ip/scramble_sequence_0/sim/scramble_sequence_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

