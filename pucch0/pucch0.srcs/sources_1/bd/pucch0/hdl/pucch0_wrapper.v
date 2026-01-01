//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Thu Jan  1 03:00:38 2026
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
    group_hopping,
    layer2_para,
    layer2_valid,
    mcs,
    out_valid,
    rst,
    slot_ind,
    strop_request_trigger,
    trigger_05ms);
  output [1:0]ack;
  input [255:0]ant_input;
  input clk;
  input [7:0]group_hopping;
  input [511:0]layer2_para;
  input layer2_valid;
  output [3:0]mcs;
  output out_valid;
  input rst;
  input [7:0]slot_ind;
  input strop_request_trigger;
  input trigger_05ms;

  wire [1:0]ack;
  wire [255:0]ant_input;
  wire clk;
  wire [7:0]group_hopping;
  wire [511:0]layer2_para;
  wire layer2_valid;
  wire [3:0]mcs;
  wire out_valid;
  wire rst;
  wire [7:0]slot_ind;
  wire strop_request_trigger;
  wire trigger_05ms;

  pucch0 pucch0_i
       (.ack(ack),
        .ant_input(ant_input),
        .clk(clk),
        .group_hopping(group_hopping),
        .layer2_para(layer2_para),
        .layer2_valid(layer2_valid),
        .mcs(mcs),
        .out_valid(out_valid),
        .rst(rst),
        .slot_ind(slot_ind),
        .strop_request_trigger(strop_request_trigger),
        .trigger_05ms(trigger_05ms));
endmodule
