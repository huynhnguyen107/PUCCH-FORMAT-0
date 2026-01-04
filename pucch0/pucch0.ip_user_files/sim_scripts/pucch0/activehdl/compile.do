vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/xil_defaultlib
vlib activehdl/blk_mem_gen_v8_4_4
vlib activehdl/xbip_utils_v3_0_10
vlib activehdl/c_reg_fd_v12_0_6
vlib activehdl/xbip_dsp48_wrapper_v3_0_4
vlib activehdl/xbip_pipe_v3_0_6
vlib activehdl/xbip_dsp48_addsub_v3_0_6
vlib activehdl/xbip_addsub_v3_0_6
vlib activehdl/c_addsub_v12_0_14
vlib activehdl/xbip_bram18k_v3_0_6
vlib activehdl/mult_gen_v12_0_16
vlib activehdl/axi_utils_v2_0_6
vlib activehdl/cordic_v6_0_16
vlib activehdl/cmpy_v6_0_18
vlib activehdl/fifo_generator_v13_2_5
vlib activehdl/xlconstant_v1_1_6
vlib activehdl/xlconcat_v2_1_3
vlib activehdl/xlslice_v1_0_2
vlib activehdl/c_mux_bit_v12_0_6
vlib activehdl/c_shift_ram_v12_0_14
vlib activehdl/floating_point_v7_0_17
vlib activehdl/xfft_v9_1_3

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib
vmap blk_mem_gen_v8_4_4 activehdl/blk_mem_gen_v8_4_4
vmap xbip_utils_v3_0_10 activehdl/xbip_utils_v3_0_10
vmap c_reg_fd_v12_0_6 activehdl/c_reg_fd_v12_0_6
vmap xbip_dsp48_wrapper_v3_0_4 activehdl/xbip_dsp48_wrapper_v3_0_4
vmap xbip_pipe_v3_0_6 activehdl/xbip_pipe_v3_0_6
vmap xbip_dsp48_addsub_v3_0_6 activehdl/xbip_dsp48_addsub_v3_0_6
vmap xbip_addsub_v3_0_6 activehdl/xbip_addsub_v3_0_6
vmap c_addsub_v12_0_14 activehdl/c_addsub_v12_0_14
vmap xbip_bram18k_v3_0_6 activehdl/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 activehdl/mult_gen_v12_0_16
vmap axi_utils_v2_0_6 activehdl/axi_utils_v2_0_6
vmap cordic_v6_0_16 activehdl/cordic_v6_0_16
vmap cmpy_v6_0_18 activehdl/cmpy_v6_0_18
vmap fifo_generator_v13_2_5 activehdl/fifo_generator_v13_2_5
vmap xlconstant_v1_1_6 activehdl/xlconstant_v1_1_6
vmap xlconcat_v2_1_3 activehdl/xlconcat_v2_1_3
vmap xlslice_v1_0_2 activehdl/xlslice_v1_0_2
vmap c_mux_bit_v12_0_6 activehdl/c_mux_bit_v12_0_6
vmap c_shift_ram_v12_0_14 activehdl/c_shift_ram_v12_0_14
vmap floating_point_v7_0_17 activehdl/floating_point_v7_0_17
vmap xfft_v9_1_3 activehdl/xfft_v9_1_3

vlog -work xpm  -sv2k12 \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ipshared/fcfe/physical_control.srcs/sources_1/new/physical_control.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_physical_control_0_0/sim/pucch0_physical_control_0_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ipshared/5f87/demapping.srcs/sources_1/new/demapping.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_demapping_0_0/sim/pucch0_demapping_0_0.v" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_rx_duplication_0_0/rx_duplication.srcs/sources_1/ip/rx_dup_mem_1/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_rx_duplication_0_0/rx_duplication.srcs/sources_1/ip/rx_dup_mem_1/sim/rx_dup_mem_1.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_rx_duplication_0_0/rx_duplication.srcs/sources_1/ip/rx_dup_mem_0/sim/rx_dup_mem_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ipshared/c2cc/rx_duplication.srcs/sources_1/new/rx_duplication.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_rx_duplication_0_0/sim/pucch0_rx_duplication_0_0.v" \

vcom -work xbip_utils_v3_0_10 -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_cordic_0/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_6 -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_cordic_0/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_cordic_0/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_cordic_0/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6 -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_cordic_0/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_6 -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_cordic_0/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_14 -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_cordic_0/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_cordic_0/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_cordic_0/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_6 -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_cordic_0/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work cordic_v6_0_16 -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_cordic_0/hdl/cordic_v6_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_cordic_0/sim/correlation_cordic_0.vhd" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_mult_gen_1/sim/correlation_mult_gen_1.vhd" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_mult_gen_0/sim/correlation_mult_gen_0.vhd" \

vcom -work cmpy_v6_0_18 -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_11/hdl/cmpy_v6_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_11/sim/xcorr_cmpy_11.vhd" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_10/sim/xcorr_cmpy_10.vhd" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_9/sim/xcorr_cmpy_9.vhd" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_8/sim/xcorr_cmpy_8.vhd" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_7/sim/xcorr_cmpy_7.vhd" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_6/sim/xcorr_cmpy_6.vhd" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_5/sim/xcorr_cmpy_5.vhd" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_4/sim/xcorr_cmpy_4.vhd" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_3/sim/xcorr_cmpy_3.vhd" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_2/sim/xcorr_cmpy_2.vhd" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_1/sim/xcorr_cmpy_1.vhd" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_cmpy_0/sim/xcorr_cmpy_0.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_fifo/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_fifo/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_fifo/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/ip/xcorr_fifo/sim/xcorr_fifo.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/xcorr_12.srcs/sources_1/new/xcorr_12.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_xcorr_12_0/sim/correlation_xcorr_12_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_fifo_generator_1/sim/correlation_fifo_generator_1.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/correlation.srcs/sources_1/ip/correlation_fifo_generator_0/sim/correlation_fifo_generator_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ipshared/74e7/correlation.srcs/sources_1/new/correlation.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_correlation_0_0/sim/pucch0_correlation_0_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_combine_rx_sym_0_0/combine_rx_sym.srcs/sources_1/ip/combine_fifo_generator_0/sim/combine_fifo_generator_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ipshared/35d7/combine_rx_sym.srcs/sources_1/new/combine_rx_sym.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_combine_rx_sym_0_0/sim/pucch0_combine_rx_sym_0_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ipshared/16a5/peak_search.srcs/sources_1/new/peak_search.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_peak_search_0_0/sim/pucch0_peak_search_0_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ipshared/5e8b/frame_sync.srcs/sources_1/new/frame_sync.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_frame_sync_0_3/sim/pucch0_frame_sync_0_3.v" \

vlog -work xlconstant_v1_1_6  -v2k5 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ipshared/34f7/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_xlconstant_0_0/sim/pucch0_xlconstant_0_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_xlconstant_0_1/sim/pucch0_xlconstant_0_1.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_sync_cyclic_0_0/sync_cyclic.srcs/sources_1/ip/cycliic_fifo_0/sim/cycliic_fifo_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ipshared/184e/sync_cyclic.srcs/sources_1/new/sync_cyclic.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_sync_cyclic_0_0/sim/pucch0_sync_cyclic_0_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_frame_sync_0_4/sim/pucch0_frame_sync_0_4.v" \

vlog -work xlconcat_v2_1_3  -v2k5 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_xlconcat_0_0/sim/pucch0_xlconcat_0_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_xlconstant_0_2/sim/pucch0_xlconstant_0_2.v" \

vlog -work xlslice_v1_0_2  -v2k5 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ipshared/11d0/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_xlslice_0_0/sim/pucch0_xlslice_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/cyclic_cmpy_0/sim/cyclic_cmpy_0.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/cyclic_fifo_generator_0/sim/cyclic_fifo_generator_0.v" \

vcom -work xil_defaultlib -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_1/sim/modulo12_mult_gen_1.vhd" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_2/sim/modulo12_mult_gen_2.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/new/modulo_12.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/sim/modulo_12_1_nomalize.v" \

vcom -work xil_defaultlib -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/dis_alpha_gen_0/ip/mult_gen_dis_alpha/sim/mult_gen_dis_alpha.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/dis_alpha_gen_0/new/dis_alpha_gen.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/dis_alpha_gen_0/sim/dis_alpha_gen_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/alpha_modulo_12_0/sim/alpha_modulo_12_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/scramble_sequence_8bits_0/scamble_sequence.srcs/sources_1/new/scramble_sequence.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/scramble_sequence_8bits_0/sim/scramble_sequence_8bits_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/new/phase_gen.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/sim/cyc_phase_gen_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/ba_se_0/base_seq.srcs/sources_1/ip/phi_matrix_0/phi_matrix.srcs/sources_1/ip/blk_mem_gen_0/sim/blk_mem_gen_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/ba_se_0/base_seq.srcs/sources_1/ip/phi_matrix_0/phi_matrix.srcs/sources_1/new/phi_matrix.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/ba_se_0/base_seq.srcs/sources_1/ip/phi_matrix_0/sim/phi_matrix_0.v" \

vcom -work xil_defaultlib -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/ba_se_0/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/m30_mul1/sim/m30_mul1.vhd" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/ba_se_0/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/m30_mul0/sim/m30_mul0.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/ba_se_0/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/new/modulo_n.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/ba_se_0/base_seq.srcs/sources_1/ip/modulo_30_2/sim/modulo_30_2.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/ba_se_0/base_seq.srcs/sources_1/ip/scramble_sequence_1bit_0/scamble_sequence.srcs/sources_1/new/scramble_sequence.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/ba_se_0/base_seq.srcs/sources_1/ip/scramble_sequence_1bit_0/sim/scramble_sequence_1bit_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/ba_se_0/base_seq.srcs/sources_1/ip/modulo_30_1/sim/modulo_30_1.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/ba_se_0/base_seq.srcs/sources_1/ip/modulo_30_0/sim/modulo_30_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/ba_se_0/base_seq.srcs/sources_1/new/base_sequence.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/cyclic_shift.srcs/sources_1/ip/ba_se_0/sim/ba_se_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ipshared/cdf8/cyclic_shift.srcs/sources_1/new/cyclic_gen.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_0/sim/pucch0_cyclic_gen_0_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_cyclic_gen_0_1/sim/pucch0_cyclic_gen_0_1.v" \

vcom -work c_mux_bit_v12_0_6 -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/c_mux_bit_v12_0_vh_rfs.vhd" \

vcom -work c_shift_ram_v12_0_14 -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/c_shift_ram_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_0_17 -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/floating_point_v7_0_vh_rfs.vhd" \

vcom -work xfft_v9_1_3 -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/xfft_v9_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/sim/xfft_0.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/ctr_pre_fft_0/ctr_pre_fft.srcs/sources_1/new/ctr_pre_fft.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/ctr_pre_fft_0/sim/ctr_pre_fft_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ipshared/d443/ofdm_demodulation.srcs/sources_1/new/fft.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_ofdm_demodulation_0_0/sim/pucch0_ofdm_demodulation_0_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ipshared/a151/ulcch_parameter.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_ulcch_parameter_0_0/sim/pucch0_ulcch_parameter_0_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_xlslice_0_1/sim/pucch0_xlslice_0_1.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/ip/pucch0_xlconcat_1_0/sim/pucch0_xlconcat_1_0.v" \
"../../../../pucch0.srcs/sources_1/bd/pucch0/sim/pucch0.v" \

vlog -work xil_defaultlib \
"glbl.v"

