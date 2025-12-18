`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/17/2025 05:49:01 PM
// Design Name: base sequence
// Module Name: modulo
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


module modulo_30 (
	input clk,	
	input rst,	
	input [10:0] in,	
	output [5:0] quotient,	
	output [4:0] remainder
	);
	wire [15: 0] divisor;
	assign divisor = 16'd1092;
	wire [26:0] floor_temp;
	wire [5:0] floor;
	wire [10:0] in_less;//30*floor
	mult_gen_0 mult_gen_0 (
	  .CLK(clk),  // input wire CLK
	  .A(in),      // input wire [10 : 0] A
	  .B(divisor),      // input wire [15 : 0] B
	  .P(floor_temp)      // output wire [26 : 0] P
	);
	assign floor = floor_temp[20:15];
	mult_gen_1 mult_gen_1 (
	  .CLK(clk),  // input wire CLK
	  .A(floor),      // input wire [5 : 0] A
	  .B(5'd30),      // input wire [4 : 0] B
	  .P(in_less)      // output wire [10 : 0] P
	);
	//output 
	assign quotient = floor;
	assign remainder = in -in_less;
endmodule 
