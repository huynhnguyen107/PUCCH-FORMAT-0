`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/28/2025 04:41:07 PM
// Design Name: tb
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


module tb();
	parameter RX=8;
	integer i=0;
	integer k=0;
	reg clk;
	reg rst;
	reg in_valid;
	reg [20*RX-1:0] in_sqrt;
	//call instance
	combine_rx_sym #(8) combine_rx_sym_0 (clk, rst, in_valid, in_sqrt);
	// create rst and initial others
	initial begin
		rst =1;
		clk =0;
		in_valid =0;
		in_sqrt =0;
		#50 rst =0;
	end
	// create clock
	always #0.5 clk =!clk;
	// create others
	initial begin
		wait (!rst)
		for (k=0; k<16;k=k+1) begin
			for (i=0; i<23;i=i+1)
				@(posedge clk) begin
					in_valid <=1;
					in_sqrt[19:0] <=(i)*(32768);
					in_sqrt[39:20] <=(i)*(32768);
					in_sqrt[59:40] <=(i)*(32768);
					in_sqrt[79:60] <=(i)*(32768);
					in_sqrt[99:80] <=(i)*(32768);
					in_sqrt[119:100] <=(i)*(32768);
					in_sqrt[139:120] <=(i)*(32768);
					in_sqrt[159:140] <=(i)*(32768);
				end
			for (i=0; i<2;i=i+1)
				@(posedge clk) begin
					in_valid <=0;
					in_sqrt[19:0] <=i-1;
					in_sqrt[39:20] <=i-1;
					in_sqrt[59:40] <=i-1;
					in_sqrt[79:60] <=i-1;
					in_sqrt[99:80] <=i-1;
					in_sqrt[119:100] <=i-1;
					in_sqrt[139:120] <=i-1;
					in_sqrt[159:140] <=i-1;
				end
		end
		for (i=0; i<23;i=i+1)
				@(posedge clk) ;
		for (k=0; k<16;k=k+1) begin
			for (i=0; i<23;i=i+1)
				@(posedge clk) begin
					in_valid <=1;
					in_sqrt[19:0] <=(i)*(32768);
					in_sqrt[39:20] <=(i)*(32768);
					in_sqrt[59:40] <=(i)*(32768);
					in_sqrt[79:60] <=(i)*(32768);
					in_sqrt[99:80] <=(i)*(32768);
					in_sqrt[119:100] <=(i)*(32768);
					in_sqrt[139:120] <=(i)*(32768);
					in_sqrt[159:140] <=(i)*(32768);
				end
			for (i=0; i<2;i=i+1)
				@(posedge clk) begin
					in_valid <=0;
					in_sqrt[19:0] <=i-1;
					in_sqrt[39:20] <=i-1;
					in_sqrt[59:40] <=i-1;
					in_sqrt[79:60] <=i-1;
					in_sqrt[99:80] <=i-1;
					in_sqrt[119:100] <=i-1;
					in_sqrt[139:120] <=i-1;
					in_sqrt[159:140] <=i-1;
				end
		end
			
	end
	
endmodule
