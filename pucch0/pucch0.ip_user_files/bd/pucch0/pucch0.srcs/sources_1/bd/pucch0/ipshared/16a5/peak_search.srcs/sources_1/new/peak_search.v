`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/28/2025 06:06:07 PM
// Design Name: peak_search
// Module Name: peak_search
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  peak search and find msc and ack
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module peak_search(
	input clk,
	input rst,
	input in_uci_valid,
	input [1:0] uci_ack,
	input peak_valid,
	input [23:0] peak,
	output  [3:0] mcs,
	output  [1:0] ack,
	output   out_valid
    );
	reg [1:0] reg_ack;
	wire ack_1;
	// peak search
	reg  valid;
	reg [7:0] cnt_res;
	reg [4:0] cnt;
	reg [2:0] idx;
	reg [23:0] max;
	// latch 
	reg latch_valid;
	reg [2:0] latch_idx;
	//ack and mcs selectiom
	reg [3:0] mcs1;
	reg [1:0] ack1;
	reg [3:0] mcs2;
	reg [1:0] ack2;
	
	always @(posedge clk)
		if (rst)
			reg_ack <= 0;
		else begin
			if (in_uci_valid)
				reg_ack <= uci_ack;
		end
	assign ack_1 = reg_ack[0];
	// peak_search
	always @(posedge clk)
		if (rst) begin
			valid <= 0;
			cnt_res <= 0;
			cnt <= 0;
			idx <= 0;
			max <= 0;
			latch_valid <= 0;
			latch_idx <= 0;
		end 
		else begin
			//counter to reset
			if (peak_valid)
				cnt_res <= cnt_res +1;
			else if (cnt_res>183)
				cnt_res <= 0;
			//counter 0-22
			if (peak_valid) begin
				cnt <= (cnt==22) ? 0: cnt +1;
			end
			else if (cnt_res>183) begin
				cnt <= 0;
			end
			//find index of mcs 0-7
			if (peak_valid) begin
				idx <= idx + (cnt==22);
			end
			else if (cnt_res>183) begin
				idx <= 0;
			end
			// peak search and latch
			if (peak_valid) begin
				latch_valid <= cnt_res==183;
				if (max < peak) begin
					max <= peak;
					latch_idx <= idx;
				end	
			end
			else if (cnt_res>183) begin
				max <= 0;
				latch_idx <= 0;
				latch_valid <= 0;
			end
		end
	//ack and msc selection
	always @(*) begin
		case (latch_idx)
			3'd0: begin
				mcs1 = 0;
				ack1 = 0;
				mcs2 = 0;
				ack2 = 0;
			end
			3'd1: begin
				mcs1 = 6;
				ack1 = 1;
				mcs2 = 3;
				ack2 = 1;
			end
			3'd2: begin
				mcs1 = 3;
				ack1 = 0;
				mcs2 = 9;
				ack2 = 2;
			end
			3'd3: begin
				mcs1 = 9;
				ack1 = 1;
				mcs2 = 6;
				ack2 = 3;
			end
			3'd4: begin
				mcs1 = 0;
				ack1 = 0;
				mcs2 = 1;
				ack2 = 0;
			end
			3'd5: begin
				mcs1 = 0;
				ack1 = 0;
				mcs2 = 4;
				ack2 = 1;
			end
			3'd6: begin
				mcs1 = 0;
				ack1 = 0;
				mcs2 = 10;
				ack2 = 2;
			end
			3'd7: begin
				mcs1 = 0;
				ack1 = 0;
				mcs2 = 7;
				ack2 = 3;
			end
			default: begin
				mcs1 = 0;
				ack1 = 0;
				mcs2 = 0;
				ack2 = 0;
			end
		endcase
	end
	//output
	assign out_valid = latch_valid;
	assign mcs = ack_1 ? mcs1 : mcs2;
	assign ack = ack_1 ? ack1 : ack2;
endmodule
