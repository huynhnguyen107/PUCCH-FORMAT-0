`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2025 02:39:49 PM
// Design Name: scramble_sequence
// Module Name: tb
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  modulo the input with N to find quotient and remainder
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb();
	reg clk;
	reg rst;
	reg in_valid;
	reg [5:0] ID;
	wire out_valid;
	wire [31:0] x1_1600_1631;
	wire [31:0] x2_1600_1631;
	//instance x1_x2_init
	x1_x2_init x1_x2_init_0 (clk, rst, in_valid, ID, out_valid, x1_1600_1631, x2_1600_1631);
	//intial all signals and create rst
	initial begin
		clk =0;
		rst =1;
		in_valid =0;
		ID =0;
		#50 rst=0;
	end
	//create clock
	always #0.5 clk=~clk;
	//create others
	initial begin
		wait(!rst)
		@(posedge clk) begin
			in_valid <= 1;
			ID <= 1;
		end
		@(posedge clk) begin
			in_valid <= 0;
			ID <= 0;
		end
	end
endmodule
