`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/29/2025 08:15:06 PM
// Design Name: 
// Module Name: tb
// Design Name: sync_cyclic
// Module Name: sync_cyclic
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  It sync two of cyclic shift before to cal correlation 
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb( );
	reg clk;
	reg rst;
	reg valid_0;
	reg [31:0] cyclic_0;
	reg valid_1;
	reg [31:0] cyclic_1;
	integer i;
	// call instance
	sync_cyclic sync_cyclic0 (clk, rst, valid_0, cyclic_0, valid_1, cyclic_1);
	// create rst and init others
	initial begin
		rst =1 ;
		clk=0;
		valid_0=0;
		cyclic_0=0;
		valid_1=0;
		cyclic_1=0;
		#50 rst=0;
	end
	// create clock
	always #0.5 clk=!clk;
	//create others
	initial begin
		wait(!rst)
		for (i=0; i<96; i=i+1)
			@(posedge clk) begin
				valid_0 <= 1;
				cyclic_0 <= i;
				valid_1 <= 1;
				cyclic_1 <= 95-i;
			end
		for (i=0; i<96; i=i+1)
			@(posedge clk) begin
				valid_0 <= 0;
				cyclic_0 <= 0;
				valid_1 <= 0;
				cyclic_1 <= 0;
			end
	end
endmodule
