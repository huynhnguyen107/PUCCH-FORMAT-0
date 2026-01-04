//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Sun Jan  4 02:00:33 2026
//Host        : LAPTOP-CHCSI1R5 running 64-bit major release  (build 9200)
//Command     : generate_target pucch0_wrapper.bd
//Design      : pucch0_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module pucch0_wrapper
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
  input clk;
  input i_config_valid;
  input [7:0]i_group_hopping;
  input [15:0]i_hopping_ID;
  input i_pucch_valid;
  output [3:0]mcs;
  output out_valid;
  input rst;
  input strop_request_trigger;
  input trigger_05ms;
  input [511:0]ulcch_para;

  wire [1:0]ack;
  wire [255:0]ant_input;
  wire clk;
  wire i_config_valid;
  wire [7:0]i_group_hopping;
  wire [15:0]i_hopping_ID;
  wire i_pucch_valid;
  wire [3:0]mcs;
  wire out_valid;
  wire rst;
  wire strop_request_trigger;
  wire trigger_05ms;
  wire [511:0]ulcch_para;

  pucch0 pucch0_i
       (.ack(ack),
        .ant_input(ant_input),
        .clk(clk),
        .i_config_valid(i_config_valid),
        .i_group_hopping(i_group_hopping),
        .i_hopping_ID(i_hopping_ID),
        .i_pucch_valid(i_pucch_valid),
        .mcs(mcs),
        .out_valid(out_valid),
        .rst(rst),
        .strop_request_trigger(strop_request_trigger),
        .trigger_05ms(trigger_05ms),
        .ulcch_para(ulcch_para));
endmodule
