vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../ip/scramble_sequence_8bits_0/scamble_sequence.srcs/sources_1/new/scramble_sequence.v" \
"../../../ip/scramble_sequence_8bits_0/sim/scramble_sequence_8bits_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

