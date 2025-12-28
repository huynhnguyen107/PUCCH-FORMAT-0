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
	input [31:0] resourcesetresourceset,
	input cyclic_shift_valid,
	input [31:0] cyclic_shift
		);
	wire [31:0] d_cyclic_shift;
	wire [31:0] d_resourceset;
	reg control_valid;
	reg [3:0] cnt;
	//save cyclic shift to fifo
	correlation_fifo_generator_0 correlation_fifo_generator_0 (
	  .clk(clk),      // input wire clk
	  .din(cyclic_shift),      // input wire [31 : 0] din
	  .wr_en(cyclic_shift_valid),  // input wire wr_en
	  .rd_en(),  // input wire rd_en
	  .dout(),    // output wire [31 : 0] dout
	  .full(),    // output wire full
	  .empty()  // output wire empty
	);
	correlation_fifo_generator_1 your_instance_name (
	  .clk(clk),      // input wire clk
	  .din(resourcesetresourceset),      // input wire [31 : 0] din
	  .wr_en(resourceset_valid),  // input wire wr_en
	  .rd_en(),  // input wire rd_en
	  .dout(),    // output wire [31 : 0] dout
	  .full(),    // output wire full
	  .empty()  // output wire empty
	);
	always @(posedge clk)
		if (rst) begin
			control_valid <= 0;
			cnt <= 0;
			d_resourceset <= 0;
		end
		else begin
			if (resourceset_valid & cnt < 11)
				control_valid <= 1;
			else 
				control_valid <= 0;
			if (control_valid)
				cnt <=  cnt +1 ;
			else
				cnt <= 0;
		end
endmodule
