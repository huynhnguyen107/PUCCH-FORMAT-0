vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../ip/frame_sync_0/frame_sync.srcs/sources_1/new/frame_sync.v" \
"../../../ip/frame_sync_0/sim/frame_sync_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

