//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Mon Jan 26 22:35:13 2026
//Host        : LAPTOP-CHCSI1R5 running 64-bit major release  (build 9200)
//Command     : generate_target pucch0.bd
//Design      : pucch0
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "pucch0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=pucch0,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=20,numReposBlks=20,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "pucch0.hwdef" *) 
module pucch0
   (ack,
    ant_input,
    clk,
    i_config_valid,
    i_group_hopping,
    i_hopping_ID,
    i_pucch_valid,
    mcs,
    out_valid,
    rst,
    strop_request_trigger,
    trigger_05ms,
    ulcch_para);
  output [1:0]ack;
  input [255:0]ant_input;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN pucch0_clk, FREQ_HZ 122880000, INSERT_VIP 0, PHASE 0.000" *) input clk;
  input i_config_valid;
  input [7:0]i_group_hopping;
  input [15:0]i_hopping_ID;
  input i_pucch_valid;
  output [3:0]mcs;
  output out_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rst;
  input strop_request_trigger;
  input trigger_05ms;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ULCCH_PARA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ULCCH_PARA, LAYERED_METADATA undef" *) input [511:0]ulcch_para;

  wire [255:0]ant_input_1;
  wire clk_1;
  wire [23:0]combine_rx_sym_0_peak;
  wire combine_rx_sym_0_peak_valid;
  wire [19:0]correlation_0_sqrt;
  wire correlation_0_sqrt_valid;
  wire [31:0]cyclic_gen_0_cyclic_shift;
  wire cyclic_gen_0_cyclic_shift_valid;
  wire [31:0]cyclic_gen_1_cyclic_shift;
  wire cyclic_gen_1_cyclic_shift_valid;
  wire demapping_0_resoureset0_valid;
  wire demapping_0_resoureset1_valid;
  wire demapping_0_two_symbol_valid;
  wire [11:0]frame_sync_0_cp;
  wire frame_sync_0_start_symbol;
  wire [8:0]frame_sync_1_rb_idx;
  wire [4:0]frame_sync_1_slot_idx;
  wire [3:0]frame_sync_1_sym_idx;
  wire frame_sync_1_valid_out;
  wire [7:0]group_hopping_1;
  wire i_config_valid_1;
  wire [7:0]i_group_hopping_1;
  wire [15:0]i_hopping_ID_1;
  wire [511:0]layer2_para_1;
  wire [15:0]layer2_parameter_0_uci_ack;
  wire [7:0]layer2_parameter_0_uci_frist_symbol;
  wire [15:0]layer2_parameter_0_uci_m0;
  wire [15:0]layer2_parameter_0_uci_nid;
  wire layer2_parameter_0_uci_valid;
  wire layer2_valid_1;
  wire ofdm_demodulation_0_start_symbol;
  wire [31:0]ofdm_demodulation_v2_0_pucch_ofdm;
  wire [1:0]peak_search_0_ack;
  wire [3:0]peak_search_0_mcs;
  wire peak_search_0_out_valid;
  wire physical_control_0_start_symbol;
  wire rst_1;
  wire [255:0]rx_duplication_0_ofdm_resource_ext;
  wire rx_duplication_0_ofdm_resource_ext_valid;
  wire [15:0]slot_ind_1;
  wire strop_request_trigger_1;
  wire [31:0]sync_cyclic_0_cyclic;
  wire sync_cyclic_0_cyclic_valid;
  wire trigger_05ms_1;
  wire [7:0]ulcch_parameter_0_uci_intra_fre_hopping;
  wire [15:0]ulcch_parameter_0_uci_pbr_offset;
  wire [15:0]ulcch_parameter_0_uci_second_prb;
  wire [7:0]ulcch_parameter_0_uci_symbol;
  wire [255:0]xlconcat_0_dout;
  wire [159:0]xlconcat_1_dout;
  wire [0:0]xlconstant_0_dout;
  wire [0:0]xlconstant_1_dout;
  wire [2:0]xlconstant_2_dout;
  wire [31:0]xlslice_0_Dout;
  wire [31:0]xlslice_1_Dout;

  assign ack[1:0] = peak_search_0_ack;
  assign ant_input_1 = ant_input[255:0];
  assign clk_1 = clk;
  assign i_config_valid_1 = i_config_valid;
  assign i_group_hopping_1 = i_group_hopping[7:0];
  assign i_hopping_ID_1 = i_hopping_ID[15:0];
  assign layer2_para_1 = ulcch_para[511:0];
  assign layer2_valid_1 = i_pucch_valid;
  assign mcs[3:0] = peak_search_0_mcs;
  assign out_valid = peak_search_0_out_valid;
  assign rst_1 = rst;
  assign strop_request_trigger_1 = strop_request_trigger;
  assign trigger_05ms_1 = trigger_05ms;
  pucch0_combine_rx_sym_0_0 combine_rx_sym_0
       (.clk(clk_1),
        .in_sqrt(xlconcat_1_dout),
        .in_valid(correlation_0_sqrt_valid),
        .peak(combine_rx_sym_0_peak),
        .peak_valid(combine_rx_sym_0_peak_valid),
        .rst(rst_1));
  pucch0_correlation_0_0 correlation_0
       (.clk(clk_1),
        .cyclic_shift(sync_cyclic_0_cyclic),
        .cyclic_shift_valid(sync_cyclic_0_cyclic_valid),
        .resourceset_valid(rx_duplication_0_ofdm_resource_ext_valid),
        .resourcesetresourceset(xlslice_1_Dout),
        .rst(rst_1),
        .sqrt(correlation_0_sqrt),
        .sqrt_valid(correlation_0_sqrt_valid));
  pucch0_cyclic_gen_0_0 cyclic_gen_0
       (.clk(clk_1),
        .cyclic_shift(cyclic_gen_0_cyclic_shift),
        .cyclic_shift_valid(cyclic_gen_0_cyclic_shift_valid),
        .in_valid(layer2_parameter_0_uci_valid),
        .rst(rst_1),
        .uci_ack(layer2_parameter_0_uci_ack[1:0]),
        .uci_first_symbol(layer2_parameter_0_uci_frist_symbol[3:0]),
        .uci_grouphopping(group_hopping_1[1:0]),
        .uci_m0(layer2_parameter_0_uci_m0[3:0]),
        .uci_nID(layer2_parameter_0_uci_nid[10:0]),
        .uci_nhop(xlconstant_1_dout),
        .uci_slot(slot_ind_1[4:0]),
        .uci_sym_alloc(xlconstant_1_dout));
  pucch0_cyclic_gen_0_1 cyclic_gen_1
       (.clk(clk_1),
        .cyclic_shift(cyclic_gen_1_cyclic_shift),
        .cyclic_shift_valid(cyclic_gen_1_cyclic_shift_valid),
        .in_valid(layer2_parameter_0_uci_valid),
        .rst(rst_1),
        .uci_ack(layer2_parameter_0_uci_ack[1:0]),
        .uci_first_symbol(layer2_parameter_0_uci_frist_symbol[3:0]),
        .uci_grouphopping(group_hopping_1[1:0]),
        .uci_m0(layer2_parameter_0_uci_m0[3:0]),
        .uci_nID(layer2_parameter_0_uci_nid[10:0]),
        .uci_nhop(xlconstant_0_dout),
        .uci_slot(slot_ind_1[4:0]),
        .uci_sym_alloc(xlconstant_0_dout));
  pucch0_demapping_0_0 demapping_0
       (.clk(clk_1),
        .fr_data_valid(frame_sync_1_valid_out),
        .fr_rb(frame_sync_1_rb_idx),
        .fr_slot(frame_sync_1_slot_idx),
        .fr_symbol(frame_sync_1_sym_idx),
        .resoureset0_valid(demapping_0_resoureset0_valid),
        .resoureset1_valid(demapping_0_resoureset1_valid),
        .rst(rst_1),
        .two_symbol_valid(demapping_0_two_symbol_valid),
        .uci_first_symbol_idx(layer2_parameter_0_uci_frist_symbol[3:0]),
        .uci_instra_fre_hop(ulcch_parameter_0_uci_intra_fre_hopping[0]),
        .uci_nsymbols(ulcch_parameter_0_uci_symbol[1:0]),
        .uci_prbsoffset(ulcch_parameter_0_uci_pbr_offset[1:0]),
        .uci_secondhop_prb(ulcch_parameter_0_uci_second_prb[9:0]),
        .uci_slot(slot_ind_1[4:0]),
        .uci_valid(layer2_parameter_0_uci_valid));
  pucch0_frame_sync_0_3 frame_sync_0
       (.clk(clk_1),
        .cp(frame_sync_0_cp),
        .in_start_symbol(physical_control_0_start_symbol),
        .rst(rst_1),
        .start_symbol(frame_sync_0_start_symbol));
  pucch0_frame_sync_0_4 frame_sync_1
       (.clk(clk_1),
        .in_start_symbol(ofdm_demodulation_0_start_symbol),
        .rb_idx(frame_sync_1_rb_idx),
        .rst(rst_1),
        .slot_idx(frame_sync_1_slot_idx),
        .sym_idx(frame_sync_1_sym_idx),
        .valid_out(frame_sync_1_valid_out));
  pucch0_ofdm_demodulation_0_0 ofdm_demodulation_0
       (.ant_input(xlslice_0_Dout),
        .clk(clk_1),
        .i_start_symbol(frame_sync_0_start_symbol),
        .i_trigger_cp(frame_sync_0_cp),
        .pucch_ofdm(ofdm_demodulation_v2_0_pucch_ofdm),
        .rst(rst_1),
        .scale_factor({1'b0,xlconstant_2_dout}),
        .start_symbol(ofdm_demodulation_0_start_symbol));
  pucch0_peak_search_0_0 peak_search_0
       (.ack(peak_search_0_ack),
        .clk(clk_1),
        .in_uci_valid(layer2_parameter_0_uci_valid),
        .mcs(peak_search_0_mcs),
        .out_valid(peak_search_0_out_valid),
        .peak(combine_rx_sym_0_peak),
        .peak_valid(combine_rx_sym_0_peak_valid),
        .rst(rst_1),
        .uci_ack(layer2_parameter_0_uci_ack[1:0]));
  pucch0_physical_control_0_0 physical_control_0
       (.clk(clk_1),
        .in_0_5ms(trigger_05ms_1),
        .rst(rst_1),
        .start_symbol(physical_control_0_start_symbol),
        .stop_request_trigger(strop_request_trigger_1));
  pucch0_rx_duplication_0_0 rx_duplication_0
       (.clk(clk_1),
        .in_ofdm(xlconcat_0_dout),
        .ofdm_resource_ext(rx_duplication_0_ofdm_resource_ext),
        .ofdm_resource_ext_valid(rx_duplication_0_ofdm_resource_ext_valid),
        .resource_set0(demapping_0_resoureset0_valid),
        .resource_set1(demapping_0_resoureset1_valid),
        .rst(rst_1),
        .two_symbol_valid(demapping_0_two_symbol_valid));
  pucch0_sync_cyclic_0_0 sync_cyclic_0
       (.clk(clk_1),
        .cyclic(sync_cyclic_0_cyclic),
        .cyclic_0(cyclic_gen_0_cyclic_shift),
        .cyclic_1(cyclic_gen_1_cyclic_shift),
        .cyclic_valid(sync_cyclic_0_cyclic_valid),
        .rst(rst_1),
        .valid_0(cyclic_gen_0_cyclic_shift_valid),
        .valid_1(cyclic_gen_1_cyclic_shift_valid));
  pucch0_ulcch_parameter_0_0 ulcch_parameter_0
       (.clk(clk_1),
        .group_hopping(group_hopping_1),
        .hopping_ID(layer2_parameter_0_uci_nid),
        .i_config_valid(i_config_valid_1),
        .i_group_hopping(i_group_hopping_1),
        .i_hopping_ID(i_hopping_ID_1),
        .i_pucch_valid(layer2_valid_1),
        .pucch_valid(layer2_parameter_0_uci_valid),
        .rst(rst_1),
        .uci_ack(layer2_parameter_0_uci_ack),
        .uci_frist_symbol(layer2_parameter_0_uci_frist_symbol),
        .uci_intra_fre_hopping(ulcch_parameter_0_uci_intra_fre_hopping),
        .uci_m0(layer2_parameter_0_uci_m0),
        .uci_pbr_offset(ulcch_parameter_0_uci_pbr_offset),
        .uci_second_prb(ulcch_parameter_0_uci_second_prb),
        .uci_slot_idx(slot_ind_1),
        .uci_symbol(ulcch_parameter_0_uci_symbol),
        .ulcch_para(layer2_para_1));
  pucch0_xlconcat_0_0 xlconcat_0
       (.In0(ofdm_demodulation_v2_0_pucch_ofdm),
        .In1(ofdm_demodulation_v2_0_pucch_ofdm),
        .In2(ofdm_demodulation_v2_0_pucch_ofdm),
        .In3(ofdm_demodulation_v2_0_pucch_ofdm),
        .In4(ofdm_demodulation_v2_0_pucch_ofdm),
        .In5(ofdm_demodulation_v2_0_pucch_ofdm),
        .In6(ofdm_demodulation_v2_0_pucch_ofdm),
        .In7(ofdm_demodulation_v2_0_pucch_ofdm),
        .dout(xlconcat_0_dout));
  pucch0_xlconcat_1_0 xlconcat_1
       (.In0(correlation_0_sqrt),
        .In1(correlation_0_sqrt),
        .In2(correlation_0_sqrt),
        .In3(correlation_0_sqrt),
        .In4(correlation_0_sqrt),
        .In5(correlation_0_sqrt),
        .In6(correlation_0_sqrt),
        .In7(correlation_0_sqrt),
        .dout(xlconcat_1_dout));
  pucch0_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_1_dout));
  pucch0_xlconstant_0_1 xlconstant_1
       (.dout(xlconstant_0_dout));
  pucch0_xlconstant_0_2 xlconstant_2
       (.dout(xlconstant_2_dout));
  pucch0_xlslice_0_0 xlslice_0
       (.Din(ant_input_1),
        .Dout(xlslice_0_Dout));
  pucch0_xlslice_0_1 xlslice_1
       (.Din(rx_duplication_0_ofdm_resource_ext),
        .Dout(xlslice_1_Dout));
endmodule
