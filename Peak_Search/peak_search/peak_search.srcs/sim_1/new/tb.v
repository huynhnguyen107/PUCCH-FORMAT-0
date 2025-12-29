`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/28/2025 07:35:07 PM
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


module tb();
	reg clk;
	reg rst;
	reg in_uci_valid;
	reg [1:0] uci_ack;
	reg peak_valid;
	reg [23:0] peak;
	integer i=0;
	integer k=0;
	// call instance
	peak_search peak_search0(clk, rst, in_uci_valid, uci_ack, peak_valid, peak);
	// create rst and initial others
	initial begin
		rst =1;
		clk =0;
		in_uci_valid =0;
		uci_ack =0;
		peak_valid =0;
		peak =0;
		#50 rst=0;
	end
	// create clock
	always #0.5 clk =!clk;
	// create others
	initial begin
		wait (!rst)
		for (k=0; k<8;k=k+1) begin
			for (i=0; i<23;i=i+1)
				@(posedge clk) begin
					in_uci_valid <=1;
					uci_ack <=1;
					peak_valid <=1;
					peak <= $urandom_range(0,512);
				end
			for (i=0; i<2;i=i+1)
				@(posedge clk) begin
					in_uci_valid <=0;
					uci_ack <=0;
					peak_valid <=0;
					peak <= 0;
				end
		end
	end
endmodule
