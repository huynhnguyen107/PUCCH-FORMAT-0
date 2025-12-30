`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/27/2025 03:16:07 PM
// Design Name: xcorr_12
// Module Name: xcorr_12
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  correlation 12 samples a and b
// r[k]=∑a[n]⋅b[n−k], m=0-11, k=-11 - +11
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
	reg resourceset_valid;
	reg [31:0] resourcesetresourceset;
	reg cyclic_shift_valid;
	reg [31:0] cyclic_shift;
	integer i=0;
	//call instance
	correlation correlation0 (clk, rst, resourceset_valid, resourcesetresourceset, cyclic_shift_valid, cyclic_shift);
	//create rst and initial signals
	initial begin
		clk =0;
		rst =1;
		resourceset_valid =0;
		resourcesetresourceset =0;
		cyclic_shift_valid =0;
		cyclic_shift =0;
		#50 rst =0;
	end
	// create clk
	always	#0.5 clk=~clk;
	// create others
	initial begin
		wait (!rst)
		for (i=0; i<192; i=i+1)
			@(posedge clk) begin
				resourceset_valid <= 1;
				resourcesetresourceset <= {16'd16384,16'd16384} ;
				cyclic_shift_valid <= 1;
				cyclic_shift <= {16'd16384,16'd16384};
			end
		@(posedge clk) begin
				resourceset_valid <= 0;
				resourcesetresourceset <=0;
				cyclic_shift_valid <= 0;
				cyclic_shift <= 0;
			end
	end
endmodule
