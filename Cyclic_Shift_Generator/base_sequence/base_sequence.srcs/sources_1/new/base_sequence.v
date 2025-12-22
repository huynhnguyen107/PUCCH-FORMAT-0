`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2025 03:16:07 PM
// Design Name: 
// Module Name: base_sequence
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module base_sequence(
	input clk,
	input rst,
	input in_valid,
	input [4:0] uci_slot,
	input [1:0] uci_grouphopping,
	input [10:0] uci_nID,
	input uci_nhop,
	output [31:0] base_sequence,
	output base_sequence_valid
    );
	reg neither_valid;
	reg disable_valid;
	reg enable_valid;
	reg [5:0] mark_p;
	//neither
	wire out_valid_neither
	reg [5:0] fss;//modulo(nid, 30) same for neither, disable, enable
	reg [4:0] enable_cinit;// floor nid/30
	//enable
	wire enable_out_valid;
	wire [7:0] enable_scramble;
	wire [5:0] enable_f_gh;

	// uci_grouphopping selection
	always @(posedge clk)
		if (rst) begin
			neither_valid <=0;
			disable_valid <=0;
			enable_valid <=0;
		end 
		else begin
			neither_valid <= in_valid ? uci_grouphopping==0: neither_valid;
			disable_valid <= in_valid ? uci_grouphopping==1: disable_valid;
			enable_valid <= in_valid ? uci_grouphopping==2: enable_valid;
		end
	//mark p =slot_index +nhop
	always @(posedge clk)
		if (rst) begin
			mark_p <=0;
		end 
		else begin
			mark_p <= in_valid ? uci_slot + uci_nhop +1: mark_p;
		end
	// neither f_gh=0,  f_ss = mod(n_id,30), v = 0;
	modulo_30_0 modulo_30_0 (
	  .clk(clk),              // input wire clk
	  .rst(rst),              // input wire rst
	  .in_valid(in_valid),    // input wire in_valid
	  .in(uci_nID),                // input wire [10 : 0] in
	  .out_valid(out_valid_neither),  // output wire out_valid
	  .quotient(fss),    // output wire [5 : 0] quotient
	  .remainder(enable_cinit)  // output wire [4 : 0] remainder
	);
	//enable 
	//scramble to find c
	scramble_sequence_0 scramble_sequence_0 (
	  .clk(clk),              // input wire clk
	  .rst(rst),              // input wire rst
	  .in_valid(out_valid_neither),    // input wire in_valid
	  .ID(enable_cinit),                // input wire [5 : 0] ID
	  .markP(mark_p),          // input wire [7 : 0] markP
	  .out_valid(enable_out_valid),  // output wire out_valid
	  .scramble(enable_scramble)    // output wire [7 : 0] scramble
	);
	//modulo enable_scramble with 30
	modulo_30_1 modulo_30_1 (
	  .clk(clk),              // input wire clk
	  .rst(rst),              // input wire rst
	  .in_valid(enable_out_valid),    // input wire in_valid
	  .in({2'd0, enable_scramble}),                // input wire [10 : 0] in
	  .out_valid(out_valid),  // output wire out_valid
	  .quotient(enable_f_gh),    // output wire [5 : 0] quotient
	  .remainder()  // output wire [4 : 0] remainder
	);
	
endmodule

