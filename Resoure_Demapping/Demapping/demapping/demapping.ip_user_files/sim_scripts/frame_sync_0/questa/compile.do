vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../ip/frame_sync_0/frame_sync.srcs/sources_1/new/frame_sync.v" \
"../../../ip/frame_sync_0/sim/frame_sync_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

