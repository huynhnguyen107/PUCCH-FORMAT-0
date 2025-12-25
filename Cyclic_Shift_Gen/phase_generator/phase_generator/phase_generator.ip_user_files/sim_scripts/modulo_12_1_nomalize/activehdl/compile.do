vlib work
vlib activehdl

vlib activehdl/xbip_utils_v3_0_10
vlib activehdl/xbip_pipe_v3_0_6
vlib activehdl/xbip_bram18k_v3_0_6
vlib activehdl/mult_gen_v12_0_16
vlib activehdl/xil_defaultlib

vmap xbip_utils_v3_0_10 activehdl/xbip_utils_v3_0_10
vmap xbip_pipe_v3_0_6 activehdl/xbip_pipe_v3_0_6
vmap xbip_bram18k_v3_0_6 activehdl/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 activehdl/mult_gen_v12_0_16
vmap xil_defaultlib activehdl/xil_defaultlib

vcom -work xbip_utils_v3_0_10 -93 \
"d:/FPGA/Vivaldo Project/PUCCH-FORMAT-0/Cyclic_Shift_Gen/phase_generator/phase_generator/phase_generator.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_1/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93 \
"d:/FPGA/Vivaldo Project/PUCCH-FORMAT-0/Cyclic_Shift_Gen/phase_generator/phase_generator/phase_generator.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_1/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -93 \
"d:/FPGA/Vivaldo Project/PUCCH-FORMAT-0/Cyclic_Shift_Gen/phase_generator/phase_generator/phase_generator.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_1/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -93 \
"d:/FPGA/Vivaldo Project/PUCCH-FORMAT-0/Cyclic_Shift_Gen/phase_generator/phase_generator/phase_generator.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_1/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../phase_generator.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_1/sim/modulo12_mult_gen_1.vhd" \
"../../../../phase_generator.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_2/sim/modulo12_mult_gen_2.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../phase_generator.srcs/sources_1/ip/modulo_12_1_nomalize/new/modulo_12.v" \
"../../../../phase_generator.srcs/sources_1/ip/modulo_12_1_nomalize/sim/modulo_12_1_nomalize.v" \

vlog -work xil_defaultlib \
"glbl.v"

