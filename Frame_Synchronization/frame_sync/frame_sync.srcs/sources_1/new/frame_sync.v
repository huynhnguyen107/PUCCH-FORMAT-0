`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 11/24/2025 05:24:50 PM
// Design Name: 
// Module Name: Frame Synchronization
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  Frame Synchronization
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module frame_sync(
	input clk,
	input rst,
	input i_trigger_05,
	output [7:0] slot_idx,
	output      start_slot,
	output [8:0] sub_idx,
	output [7:0] rb_idx,
	output start_rb,
	output [7:0] sym_idx,
	output start_symbol,
	output [7:0] frame_idx,
	output     start_frame,
	output start_subframe,
	output  valid
    );
	wire ext_valid;
	wire d_trigger_05;
	reg d_ext_valid;
	reg [7:0] cnt_slot;
	reg reg_start_slot;
	// delay  for processing OFDM demodulation
	extend_valid extend_valid_v0(clk, rst, i_trigger_05, 13'd2037, ext_valid);
	always @(posedge clk)
		if (rst) 
			d_ext_valid <= 0;
		else 
			d_ext_valid <= ext_valid;
	//falling_edge
	assign d_trigger_05 = d_ext_valid & (!ext_valid);
	//slot index and start slot
	always @(posedge clk) 
		if (rst) begin
				cnt_slot <= 0;
				reg_start_slot <= 0;
			end
		else begin
			if (i_trigger_05) begin
					cnt_slot <= (cnt_slot==20)? 8'd0: cnt_slot+1;
				end
			reg_start_slot <= i_trigger_05;
		end
	assign slot_idx = cnt_slot;
	assign start_slot = reg_start_slot;
	
endmodule



module extend_valid (
		input clk,
		input rst,
		input i_pulse,
		input [12:0] N,
		output o_valid
	);
	reg [12:0] cnt;
	reg  valid;
	always @(posedge clk)
		if (rst) begin
			cnt <= 0;
			valid <= 0;
		end
		else begin
			if (i_pulse & cnt < N-2)
				valid <= 1;
			else if (cnt >= N-2)
				valid <= 0;
			if (valid)
				cnt <= cnt +1 ;
			else if (cnt >= N-2)
				cnt <= 0;
		end
			
	assign o_valid = valid|i_pulse;
endmodule