vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/xbip_utils_v3_0_10
vlib riviera/axi_utils_v2_0_6
vlib riviera/xbip_pipe_v3_0_6
vlib riviera/xbip_bram18k_v3_0_6
vlib riviera/mult_gen_v12_0_16
vlib riviera/cmpy_v6_0_18
vlib riviera/xil_defaultlib
vlib riviera/fifo_generator_v13_2_5

vmap xpm riviera/xpm
vmap xbip_utils_v3_0_10 riviera/xbip_utils_v3_0_10
vmap axi_utils_v2_0_6 riviera/axi_utils_v2_0_6
vmap xbip_pipe_v3_0_6 riviera/xbip_pipe_v3_0_6
vmap xbip_bram18k_v3_0_6 riviera/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 riviera/mult_gen_v12_0_16
vmap cmpy_v6_0_18 riviera/cmpy_v6_0_18
vmap xil_defaultlib riviera/xil_defaultlib
vmap fifo_generator_v13_2_5 riviera/fifo_generator_v13_2_5

vlog -work xpm  -sv2k12 \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_10 -93 \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_6 -93 \
"../../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93 \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -93 \
"../../../ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -93 \
"../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work cmpy_v6_0_18 -93 \
"../../../ipstatic/hdl/cmpy_v6_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_11/sim/xcorr_cmpy_11.vhd" \
"../../../../correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_10/sim/xcorr_cmpy_10.vhd" \
"../../../../correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_9/sim/xcorr_cmpy_9.vhd" \
"../../../../correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_8/sim/xcorr_cmpy_8.vhd" \
"../../../../correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_7/sim/xcorr_cmpy_7.vhd" \
"../../../../correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_6/sim/xcorr_cmpy_6.vhd" \
"../../../../correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_5/sim/xcorr_cmpy_5.vhd" \
"../../../../correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_4/sim/xcorr_cmpy_4.vhd" \
"../../../../correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_3/sim/xcorr_cmpy_3.vhd" \
"../../../../correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_2/sim/xcorr_cmpy_2.vhd" \
"../../../../correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_1/sim/xcorr_cmpy_1.vhd" \
"../../../../correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_0/sim/xcorr_cmpy_0.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_fifo/sim/xcorr_fifo.v" \
"../../../../correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/new/xcorr_12.v" \
"../../../../correlation.srcs/sources_1/ip/correlation_xcorr_12_0/sim/correlation_xcorr_12_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

