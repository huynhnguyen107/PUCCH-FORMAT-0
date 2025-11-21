vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -sv2k12 \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../ip/ctr_fft_0/ctr_ofdm.srcs/sources_1/new/ctr_ofdm.v" \
"../../../ip/ctr_fft_0/sim/ctr_fft_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

