`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/28/2025 01:56:07 PM
// Design Name: combine_rx_sym
// Module Name: combine_rx_sym
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  add correlation of rxs and sym
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module combine_rx_sym #(parameter RX=8)(
	input clk,
	input rst,
	input in_valid,
	input [20*RX-1:0] in_sqrt,
	output reg peak_valid,
	output reg [23:0] peak
    );
	reg [21*RX/2-1:0] d_sqrt;
	reg [22*RX/4-1:0] d1_sqrt;
	reg [23*RX/8-1:0] d2_sqrt;
	reg d_valid;
	reg d1_valid;
	reg d2_valid;
	reg rd_en;
	reg [8:0] rd_cnt;
	wire [22 : 0] symbol_1;
	reg [22 : 0] d_symbol_2;
	reg [22 : 0] symbol_2;
	reg symbol_valid;
	always @(posedge clk)
		if (rst) begin
			d_valid <= 0;
			d1_valid <= 0;
			d2_valid <= 0;
			d_sqrt <= 0;
			d1_sqrt <= 0;
			d2_sqrt <= 0;
		end
		else begin
			d_valid <= in_valid;
			d1_valid <= d_valid;
			d2_valid <= d1_valid;
			if (in_valid) begin
				d_sqrt[20:0] <= in_sqrt[19:0] + in_sqrt[39:20];
				d_sqrt[41:21] <= in_sqrt[59:40] + in_sqrt[79:60];
				d_sqrt[62:42] <= in_sqrt[99:80] + in_sqrt[119:100];
				d_sqrt[83:63] <= in_sqrt[139:120] + in_sqrt[159:140];
			end
			if (d_valid) begin
				d1_sqrt[21:0] <= d_sqrt[20:0] + d_sqrt[41:21];
				d1_sqrt[43:22] <= d_sqrt[62:42] + d_sqrt[83:63];
			end
			if (d1_valid) begin
				d2_sqrt[22:0] <= d1_sqrt[21:0] + d1_sqrt[43:22];
			end
		end
	always @(posedge clk) begin
		if (rst) begin
			rd_en <= 0;
			rd_cnt <= 0;
			d_symbol_2 <= 0;
			symbol_2 <= 0;
			symbol_valid <= 0;
		end else begin
			if (d2_valid) 
				rd_cnt <= rd_cnt +1;
			else if (d2_valid & rd_cnt==367)
				rd_cnt <= 0;
		end
		rd_en <= d2_valid & (rd_cnt>183);
		d_symbol_2 <= d2_sqrt;
		symbol_2 <= d_symbol_2;
		symbol_valid <= rd_en;
	
	end
	combine_fifo_generator_0 combine_fifo_generator_0 (
	  .clk(clk),      // input wire clk
	  .din(d2_sqrt),      // input wire [22 : 0] din
	  .wr_en(d2_valid),  // input wire wr_en
	  .rd_en(rd_en),  // input wire rd_en
	  .dout(symbol_1),    // output wire [22 : 0] dout
	  .full(),    // output wire full
	  .empty(empty)  // output wire empty
	);
	//start calculate symbol_1 + symbol_2
	always @(posedge clk)
		if (rst) begin
			peak_valid <= 0;
			peak <= 0;
		end
		else begin
			if (symbol_valid)
				peak <= symbol_1 + symbol_2;
			peak_valid <= symbol_valid;
		end
			
endmodule
