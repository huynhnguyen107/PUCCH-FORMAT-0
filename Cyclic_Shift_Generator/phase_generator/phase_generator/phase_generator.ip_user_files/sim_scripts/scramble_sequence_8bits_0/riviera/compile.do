vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../ip/scramble_sequence_8bits_0/scamble_sequence.srcs/sources_1/new/scramble_sequence.v" \
"../../../ip/scramble_sequence_8bits_0/sim/scramble_sequence_8bits_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

