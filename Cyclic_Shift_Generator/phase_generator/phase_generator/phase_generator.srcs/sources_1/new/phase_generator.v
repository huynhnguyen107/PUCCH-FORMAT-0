`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/23/2025 08:02:31 PM
// Design Name: phase_generator
// Module Name: phase_generator
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  with Mzc=12, input u find phi
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module phase_generator(
	input clk,
	input rst,
	input in_valid,
	input [10:0] uci_NID,
	input [4:0] uci_slot,
	input [3:0] uci_first_symbol,
	input  uci_sym_alloc,
	input [3:0] uci_m0,
	input [1:0] uci_ack
	);
	//m_cs
	wire m_cs_valid;
	wire [3:0] m_cs;
	//ack selection
	ack_selection ack_selection0 (clk, rst, in_valid, uci_ack, out_valid, m_cs);
	// calculate n_cs
	reg [10:0] reg_uci_NID;
	reg [4:0] reg_uci_slot;
	reg [3:0] reg_uci_first_symbol;
	reg  reg_uci_sym_alloc;
	reg [3:0] reg_uci_m0;
	reg [9:0] seq_start;
	reg [8:0] slot_value;
	reg [4:0] symbol_value;
	reg d_in_valid;
	reg d2_in_valid;
	reg d3_in_valid;
	wire [7:0] n_cs;
	wire  n_cs_valid;
	//find alpha
	reg [4:0] total_m0_mcs;
	reg [9:0] pre_alpha;
	reg [3:0] alpha;
	// save input to register
	always @(posedge clk)
		if (rst) begin
			reg_uci_NID <= 0;
			reg_uci_slot <= 0;
			reg_uci_first_symbol <= 0;
			reg_uci_sym_alloc <= 0;
			reg_uci_m0 <= 0;
			seq_start <= 0;
			slot_value <= 0;
			symbol_value <= 0;
			d_in_valid <= 0;
			d2_in_valid <= 0;
			d3_in_valid <= 0;
		end
		else begin
			if (in_valid) begin
				reg_uci_slot <= uci_slot;
				reg_uci_first_symbol <= uci_first_symbol;
				reg_uci_sym_alloc <= uci_sym_alloc;
				reg_uci_m0 <= uci_m0;
				reg_uci_NID <= uci_NID;
			end
			slot_value <= (reg_uci_slot << 3) + (reg_uci_slot << 2) + (reg_uci_slot << 1);
			symbol_value <= reg_uci_first_symbol + reg_uci_sym_alloc;
			seq_start <= slot_value + symbol_value;
			d_in_valid <= in_valid;
			d2_in_valid <= d_in_valid;
			d3_in_valid <= d2_in_valid;
		end
	//scramble the value of seq_start to find n_cs
	scramble_sequence_8bits_0 scramble_sequence_8bits_0 (
	  .clk(clk),              // input wire clk
	  .rst(rst),              // input wire rst
	  .in_valid(d3_in_valid),    // input wire in_valid
	  .ID({20'd0, reg_uci_NID}),                // input wire [30 : 0] ID
	  .markP({21'd0, seq_start}),          // input wire [30 : 0] markP
	  .out_valid(n_cs_valid),  // output wire out_valid
	  .scramble(n_cs)    // output wire [7 : 0] scramble
	);
	//find alpha
	//alpha = 2 * pi / 12 * mod(m0 + m_cs + n_cs, 12);
	always @(posedge clk)
		if (rst) begin
			total_m0_mcs <= 0;
			pre_alpha <= 0;
			alpha <= 0;
		end
		else begin
			if (out_valid)
				total_m0_mcs <= m_cs + reg_uci_m0;
			if (n_cs_valid)
				pre_alpha <= n_cs + total_m0_mcs;
		end
endmodule


//select ack with input uci_ack
//							msc   ack
//sequence_cs_1_harq_ack = [0 6;  0 1]
//sequence_cs_1_harq_ack_positive_sr = [3 9;  0 1]; %positive SR
//2 harq
//sequence_cs_2_harq_ack = [0 3 9 6; 0 0 1 1; 0 1 0 1]; % SR negative ,4 bits ACK
//sequence_cs_2_harq_ack_positive_sr = [1 4 10 7; 0 0 1 1; 0 1 0 1]; 
//ack=1--->mcs 0 6 3 9 0 0 0  0 //fill 4 0 to fix to the max is 8 mcs
//ack=2--->mcs 0 3 9 6 1 4 10 7
module ack_selection(
	input clk,	
	input rst,	
	input in_valid,	
	input [1:0] uci_ack,	
	output out_valid,	
	output  [3:0] m_cs	
	);
	reg valid;
	reg [1:0] reg_uci_ack;
	reg [2:0] cnt;
	reg [3:0] m_cs1;
	reg [3:0] m_cs2;
	always @(posedge clk) begin
		if (rst) begin
			valid <= 0;
			reg_uci_ack <= 0;
			cnt <= 0;
		end
		else begin
			if (in_valid) 
				reg_uci_ack <= uci_ack;
			if (in_valid) 
				valid <= 1;
			else if (cnt >= 7)
				valid <= 0;
			if (valid)	
				cnt <= cnt +1;
			else
				cnt <= 0;
		end
	end
	always @(*) begin
		case (cnt)
			4'd0: m_cs1 = 0;
			4'd1: m_cs1 = 6;
			4'd2: m_cs1 = 3;
			4'd3: m_cs1 = 9;
			4'd4: m_cs1 = 0;
			4'd5: m_cs1 = 0;
			4'd6: m_cs1 = 0;
			4'd7: m_cs1 = 0;
			default: m_cs1 = 0;
		endcase
	end
	always @(*) begin
		case (cnt)
			4'd0: m_cs2 = 0;
			4'd1: m_cs2 = 3;
			4'd2: m_cs2 = 9;
			4'd3: m_cs2 = 6;
			4'd4: m_cs2 = 1;
			4'd5: m_cs2 = 4;
			4'd6: m_cs2 = 10;
			4'd7: m_cs2 = 7;
			default: m_cs1 = 0;
		endcase
	end
	assign m_cs = reg_uci_ack==1 ? m_cs1: m_cs2;
	assign out_valid = valid;
endmodule