vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xbip_utils_v3_0_10
vlib questa_lib/msim/xbip_pipe_v3_0_6
vlib questa_lib/msim/xbip_bram18k_v3_0_6
vlib questa_lib/msim/mult_gen_v12_0_16
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xbip_utils_v3_0_10 questa_lib/msim/xbip_utils_v3_0_10
vmap xbip_pipe_v3_0_6 questa_lib/msim/xbip_pipe_v3_0_6
vmap xbip_bram18k_v3_0_6 questa_lib/msim/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 questa_lib/msim/mult_gen_v12_0_16
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm -64 -sv \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_10 -64 -93 \
"d:/FPGA/Vivaldo Project/PUCCH-FORMAT-0/Cyclic_Shift_Gen/cyclic_shift_gen/cyclic_shift_generator.srcs/sources_1/ip/phase_generator_0_2/phase_generator.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_1/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -64 -93 \
"d:/FPGA/Vivaldo Project/PUCCH-FORMAT-0/Cyclic_Shift_Gen/cyclic_shift_gen/cyclic_shift_generator.srcs/sources_1/ip/phase_generator_0_2/phase_generator.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_1/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -64 -93 \
"d:/FPGA/Vivaldo Project/PUCCH-FORMAT-0/Cyclic_Shift_Gen/cyclic_shift_gen/cyclic_shift_generator.srcs/sources_1/ip/phase_generator_0_2/phase_generator.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_1/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -64 -93 \
"d:/FPGA/Vivaldo Project/PUCCH-FORMAT-0/Cyclic_Shift_Gen/cyclic_shift_gen/cyclic_shift_generator.srcs/sources_1/ip/phase_generator_0_2/phase_generator.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_1/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../ip/phase_generator_0_2/phase_generator.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_1/sim/modulo12_mult_gen_1.vhd" \
"../../../ip/phase_generator_0_2/phase_generator.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_2/sim/modulo12_mult_gen_2.vhd" \

vlog -work xil_defaultlib -64 \
"../../../ip/phase_generator_0_2/phase_generator.srcs/sources_1/ip/modulo_12_1_nomalize/new/modulo_12.v" \
"../../../ip/phase_generator_0_2/phase_generator.srcs/sources_1/ip/modulo_12_1_nomalize/sim/modulo_12_1_nomalize.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../ip/phase_generator_0_2/phase_generator.srcs/sources_1/ip/dis_alpha_gen_0/ip/mult_gen_dis_alpha/sim/mult_gen_dis_alpha.vhd" \

vlog -work xil_defaultlib -64 \
"../../../ip/phase_generator_0_2/phase_generator.srcs/sources_1/ip/dis_alpha_gen_0/new/dis_alpha_gen.v" \
"../../../ip/phase_generator_0_2/phase_generator.srcs/sources_1/ip/dis_alpha_gen_0/sim/dis_alpha_gen_0.v" \
"../../../ip/phase_generator_0_2/phase_generator.srcs/sources_1/ip/alpha_modulo_12_0/sim/alpha_modulo_12_0.v" \
"../../../ip/phase_generator_0_2/phase_generator.srcs/sources_1/ip/scramble_sequence_8bits_0/scamble_sequence.srcs/sources_1/new/scramble_sequence.v" \
"../../../ip/phase_generator_0_2/phase_generator.srcs/sources_1/ip/scramble_sequence_8bits_0/sim/scramble_sequence_8bits_0.v" \
"../../../ip/phase_generator_0_2/phase_generator.srcs/sources_1/new/phase_generator.v" \
"../../../ip/phase_generator_0_2/sim/phase_generator_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

