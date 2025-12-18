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
	reg [5:0] mo_quotient;
	reg [4:0] mo_remainder;
	reg  mo_valid;
	reg  d_mo_valid;
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
			mark_p <= in_valid ? uci_slot + uci_nhop : mark_p;
		end
	// nID modulus 30 to find quotient and remainder
	modulo_30_0 modulo_30_0 (
	  .clk(clk),              // input wire clk
	  .rst(rst),              // input wire rst
	  .in(uci_nID),                // input wire [10 : 0] in
	  .quotient(mo_quotient),    // output wire [5 : 0] quotient
	  .remainder(mo_remainder)  // output wire [4 : 0] remainder
	);
	//valid
	always @(posedge clk)
		if (rst) begin
			mo_valid <=0;
			d_mo_valid <=0;
		end 
		else begin
			mo_valid <= in_valid;
			d_mo_valid <= mo_valid;
		end
endmodule

