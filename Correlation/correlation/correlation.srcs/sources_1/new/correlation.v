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
	input [31:0] cyclic_shift,
	output sqrt_valid,
	output [19:0] sqrt//20.15
		);
	wire [31:0] fifo_cyclic_shift;
	wire [31:0] fifo_resourceset;
	reg valid_400;
	wire valid;
	reg [8:0] cnt_400;
	reg xcorr_valid;
	wire [41:0] corre;
	wire  corre_valid;
	wire [41:0] I2;
	wire [41:0] Q2;
	reg total_valid;
	wire [25:0] IQ_total;


	//save cyclic shift to fifo
	correlation_fifo_generator_0 correlation_fifo_generator_0 (
	  .clk(clk),      // input wire clk
	  .din(cyclic_shift),      // input wire [31 : 0] din
	  .wr_en(cyclic_shift_valid),  // input wire wr_en
	  .rd_en(valid),  // input wire rd_en
	  .dout(fifo_cyclic_shift),    // output wire [31 : 0] dout
	  .full(),    // output wire full
	  .empty()  // output wire empty
	);
	correlation_fifo_generator_1 correlation_fifo_generator_1 (
	  .clk(clk),      // input wire clk
	  .din(resourcesetresourceset),      // input wire [31 : 0] din
	  .wr_en(resourceset_valid),  // input wire wr_en
	  .rd_en(valid),  // input wire rd_en
	  .dout(fifo_resourceset),    // output wire [31 : 0] dout
	  .full(),    // output wire full
	  .empty()  // output wire empty
	);
	always @(posedge clk)
		if (rst) begin
			valid_400 <= 0;
			cnt_400 <= 0;
			xcorr_valid <= 0;
		end
		else begin
			if (resourceset_valid )
				valid_400 <= 1;
			else if (valid_400 & cnt_400<399)
				valid_400 <= 1;
			else
				valid_400 <= 0;
			if (valid_400)
				cnt_400 <= cnt_400 +1;
			else
				cnt_400 <= 0;
			xcorr_valid <= valid;
		end
	assign valid = valid_400 & ((cnt_400>=0&cnt_400<=11)|(cnt_400>=25&cnt_400<=36)|(cnt_400>=50&cnt_400<=61)|(cnt_400>=75&cnt_400<=86)
								|(cnt_400>=100&cnt_400<=111)|(cnt_400>=125&cnt_400<=136)|(cnt_400>=150&cnt_400<=161)|(cnt_400>=175&cnt_400<=186)
								|(cnt_400>=200&cnt_400<=211)|(cnt_400>=225&cnt_400<=236)|(cnt_400>=250&cnt_400<=261)|(cnt_400>=275&cnt_400<=286)
								|(cnt_400>=300&cnt_400<=311)|(cnt_400>=325&cnt_400<=336)|(cnt_400>=350&cnt_400<=361)|(cnt_400>=375&cnt_400<=386));
	
	correlation_xcorr_12_0 correlation_xcorr_12_0 (
	  .clk(clk),              // input wire clk
	  .rst(rst),              // input wire rst
	  .in_valid(xcorr_valid),    // input wire in_valid
	  .a(fifo_resourceset),                  // input wire [31 : 0] a
	  .b(fifo_cyclic_shift),                  // input wire [31 : 0] b
	  .out_valid(corre_valid),  // output wire out_valid
	  .out(corre)              // output wire [41 : 0] out
	);

	correlation_mult_gen_0 correlation_mult_gen_0 (
	  .CLK(clk),  // input wire CLK
	  .A(corre[20:0]),      // input wire [20 : 0] A
	  .B(corre[20:0]),      // input wire [20 : 0] B
	  .P(I2)      // output wire [41 : 0] P concat only 25.15
	);
	correlation_mult_gen_1 correlation_mult_gen_1 (
	  .CLK(clk),  // input wire CLK
	  .A(corre[41:21]),      // input wire [20 : 0] A
	  .B(corre[41:21]),      // input wire [20 : 0] B
	  .P(Q2)      // output wire [41 : 0] P// concat only 25.15
	);
	assign IQ_total = I2[39:15] + Q2[39:15];
	 
	always @(posedge clk)
		if (rst)
			total_valid <= 0;
		else
			total_valid <= corre_valid;
	//sqrt I^2+Q^2
	correlation_cordic_0 correlation_cordic_0 (
	  .aclk(clk),                                        // input wire aclk
	  .s_axis_cartesian_tvalid(total_valid),  // input wire s_axis_cartesian_tvalid
	  .s_axis_cartesian_tdata({6'd0, IQ_total}),    // input wire [31 : 0] s_axis_cartesian_tdata
	  .m_axis_dout_tvalid(sqrt_valid),            // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(sqrt)              // output wire [23 : 0] m_axis_dout_tdata
	);



endmodule
