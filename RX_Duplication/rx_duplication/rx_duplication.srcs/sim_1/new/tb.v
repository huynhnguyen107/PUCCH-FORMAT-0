`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/16/2025 05:26:15 PM
// Design Name: tb
// Module Name: tb
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  Synchronization and dupcation RX before further process
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
	reg resource_set0;
	reg resource_set1;
	reg two_symbol_valid;
	reg [32*4-1:0] in_ofdm;
	wire [32*4-1:0] ofdm_resource_ext;
	wire  ofdm_resource_ext_valid;
	// instance
	rx_duplication #(4) rx_duplication_v0 (clk, rst,
		resource_set0, resource_set1, two_symbol_valid,
		in_ofdm, ofdm_resource_ext, ofdm_resource_ext_valid
		);
	//integer 
	integer i=0;
	//initial all signals and create rst
	initial begin
		clk = 0;
		resource_set0 = 0;
		resource_set1 = 0;
		two_symbol_valid = 0;
		in_ofdm = 0;
		rst = 1;
		#50 rst =0;
	end
	// clock
	always #0.5 clk = ~clk;
	// create others
	initial begin
		wait (!rst)
		for (i=0; i<12; i=i+1) 
			@(posedge clk) begin
				resource_set0 <= 1;
				resource_set1 <= 0;
				two_symbol_valid <= 1;
				in_ofdm = $urandom_range(-32768, 32767);
			end
		@(posedge clk) begin
			resource_set0 <= 0;
			resource_set1 <= 0;
			two_symbol_valid <= 0;
			in_ofdm <= 0;
		end
		for (i=0; i<5000; i=i+1) 
			@(posedge clk);
		for (i=0; i<12; i=i+1) 
			@(posedge clk) begin
				resource_set0 <= 0;
				resource_set1 <= 1;
				two_symbol_valid <= 1;
				in_ofdm = $urandom_range(-32768, 32767);
			end
		@(posedge clk) begin
			resource_set0 <= 0;
			resource_set1 <= 0;
			two_symbol_valid <= 0;
			in_ofdm <= 0;
		end
	end
endmodule
