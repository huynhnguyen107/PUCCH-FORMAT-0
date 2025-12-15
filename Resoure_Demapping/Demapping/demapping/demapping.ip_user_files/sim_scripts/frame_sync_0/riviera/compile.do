vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../ip/frame_sync_0/frame_sync.srcs/sources_1/new/frame_sync.v" \
"../../../ip/frame_sync_0/sim/frame_sync_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

