vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xbip_utils_v3_0_10
vlib modelsim_lib/msim/xbip_pipe_v3_0_6
vlib modelsim_lib/msim/xbip_bram18k_v3_0_6
vlib modelsim_lib/msim/mult_gen_v12_0_16
vlib modelsim_lib/msim/xil_defaultlib

vmap xbip_utils_v3_0_10 modelsim_lib/msim/xbip_utils_v3_0_10
vmap xbip_pipe_v3_0_6 modelsim_lib/msim/xbip_pipe_v3_0_6
vmap xbip_bram18k_v3_0_6 modelsim_lib/msim/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 modelsim_lib/msim/mult_gen_v12_0_16
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work xbip_utils_v3_0_10 -64 -93 \
"d:/FPGA/Vivaldo Project/PUCCH-FORMAT-0/Cyclic_Shift_Gen/phase_generator/phase_generator/phase_generator.srcs/sources_1/ip/alpha_modulo_12_0/ip/modulo12_mult_gen_1/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -64 -93 \
"d:/FPGA/Vivaldo Project/PUCCH-FORMAT-0/Cyclic_Shift_Gen/phase_generator/phase_generator/phase_generator.srcs/sources_1/ip/alpha_modulo_12_0/ip/modulo12_mult_gen_1/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -64 -93 \
"d:/FPGA/Vivaldo Project/PUCCH-FORMAT-0/Cyclic_Shift_Gen/phase_generator/phase_generator/phase_generator.srcs/sources_1/ip/alpha_modulo_12_0/ip/modulo12_mult_gen_1/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -64 -93 \
"d:/FPGA/Vivaldo Project/PUCCH-FORMAT-0/Cyclic_Shift_Gen/phase_generator/phase_generator/phase_generator.srcs/sources_1/ip/alpha_modulo_12_0/ip/modulo12_mult_gen_1/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../phase_generator.srcs/sources_1/ip/alpha_modulo_12_0/ip/modulo12_mult_gen_1/sim/modulo12_mult_gen_1.vhd" \
"../../../../phase_generator.srcs/sources_1/ip/alpha_modulo_12_0/ip/modulo12_mult_gen_2/sim/modulo12_mult_gen_2.vhd" \

vlog -work xil_defaultlib -64 -incr \
"../../../../phase_generator.srcs/sources_1/ip/alpha_modulo_12_0/new/modulo_12.v" \
"../../../../phase_generator.srcs/sources_1/ip/alpha_modulo_12_0/sim/alpha_modulo_12_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

