`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/29/2025 07:37:56 PM
// Design Name: 
// Module Name: sync_cyclic
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


module sync_cyclic(
	input clk,
	input rst,
	input valid_0,
	input [31:0] cyclic_0,
	input valid_1,
	input [31:0] cyclic_1,
	output cyclic_valid,
	output [31:0] cyclic
    );
	wire [31:0] wr_cyclic_1;
	wire rd_en; 
	reg cnt_valid; 
	reg [7:0] cnt; 
	cycliic_fifo_0 cycliic_fifo_0 (
	  .clk(clk),      // input wire clk
	  .din(cyclic_1),      // input wire [31 : 0] din
	  .wr_en(valid_1),  // input wire wr_en
	  .rd_en(rd_en),  // input wire rd_en
	  .dout(wr_cyclic_1),    // output wire [31 : 0] dout
	  .full(),    // output wire full
	  .empty()  // output wire empty
	);

	always @(posedge clk)
		if (rst) begin
			cnt <=0;
			cnt_valid <=0;
		end
		else begin 
			// cnt to 0-191
			if (valid_1)
				cnt_valid <= 1;
			else if (cnt >191)
				cnt_valid <= 0;
			if (cnt_valid) 
				cnt <= cnt +1;
			else
				cnt <= 0;
		end
	assign rd_en = (cnt>=94&cnt<=189);
	assign cyclic_valid = valid_0 |(cnt>=94&cnt<=190);
	assign cyclic = valid_0 ? cyclic_0: wr_cyclic_1;
endmodule
