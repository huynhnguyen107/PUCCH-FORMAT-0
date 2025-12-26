`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/25/2025 03:16:07 PM
// Design Name: correlation
// Module Name: correlation
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  correlation rx and cyclic shift=xcorr in matlab
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module correlation(
	input clk,
	input rst,
	input resourceset_valid,
	input [31:0] resourceset,
	input cyclic_shift_valid,
	input [31:0] cyclic_shift
		);
	
endmodule
