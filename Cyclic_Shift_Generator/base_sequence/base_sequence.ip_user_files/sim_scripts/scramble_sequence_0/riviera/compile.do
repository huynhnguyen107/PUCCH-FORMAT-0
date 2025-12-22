vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../base_sequence.srcs/sources_1/ip/scramble_sequence_0/scamble_sequence.srcs/sources_1/new/scramble_sequence.v" \
"../../../../base_sequence.srcs/sources_1/ip/scramble_sequence_0/sim/scramble_sequence_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

