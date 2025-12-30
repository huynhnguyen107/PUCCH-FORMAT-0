`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/16/2025 05:26:15 PM
// Design Name: Rx Duplication
// Module Name: rx_duplication
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


module rx_duplication #(parameter RX_num=4)(
		input clk,
		input rst,
		input resource_set0,
		input resource_set1,
		input two_symbol_valid,
		input [32*RX_num-1:0] in_ofdm,
		output [32*RX_num-1:0] ofdm_resource_ext,
		output  ofdm_resource_ext_valid
		);
	wire [32*RX_num-1:0] ofdm0;
	wire [32*RX_num-1:0] ofdm1;
	//resource 0
	wire valid_96_0 ;
	reg  d1_valid_96_0;
	reg  d2_valid_96_0;
	wire f_edge;
	reg [6 : 0] addra0 ;
	wire [32*RX_num-1:0] douta0;
	//resource 1
	wire valid_96_1 ;
	reg  d1_valid_96_1;
	reg  d2_valid_96_1;
	reg [6 : 0] addra1 ;
	wire [32*RX_num-1:0] douta1;
	//check two symbols and capture ofdm which rely on resource_sets
	assign ofdm0 = resource_set0 ? in_ofdm : 0;
	assign ofdm1 = two_symbol_valid ? (resource_set1 ? in_ofdm : 0): 0;
	// store ofdm into BRAM and duplicate them.
	//instance bram
	rx_dup_mem_0 rx_dup_mem_0 (
	  .clka(clk),    // input wire clka
	  .wea(resource_set0),      // input wire [0 : 0] wea
	  .addra(addra0),  // input wire [6 : 0] addra
	  .dina(ofdm0),    // input wire [127 : 0] dina
	  .douta(douta0)  // output wire [127 : 0] douta
	);
	rx_dup_mem_1 rx_dup_mem_1 (
	  .clka(clk),    // input wire clka
	  .wea(resource_set1),      // input wire [0 : 0] wea
	  .addra(addra1),  // input wire [6 : 0] addra
	  .dina(ofdm1),    // input wire [127 : 0] dina
	  .douta(douta1)  // output wire [127 : 0] douta
    );
	//control wea and addra
	//extend to 96 cycles
	extend_valid_new  #(96) extend_valid_new_0 (clk, rst, resource_set1, valid_96_0) ;
	falling_edge  falling_edge0 (clk, rst, valid_96_0, f_edge) ;
	extend_valid_new  #(96) extend_valid_new_1 (clk, rst, f_edge, valid_96_1) ;
	always @(posedge clk)
		if (rst) begin
			addra0 <= 0;
			addra1 <= 0;
			d1_valid_96_0 <= 0;
			d2_valid_96_0 <= 0;
			d1_valid_96_1 <= 0;
			d2_valid_96_1 <= 0;
		end
		else begin
			//control address
			addra0 <= resource_set0 ? addra0 +1 :(valid_96_0 ? (addra0 < 11 ? addra0 + 1:0 ):0);
			addra1 <= resource_set1 ? addra1 +1 :(valid_96_1 ? (addra1 < 11 ? addra1 + 1:0 ):0);
			// valid out
			d1_valid_96_0 <= valid_96_0;
			d2_valid_96_0 <= d1_valid_96_0;
			d1_valid_96_1 <= valid_96_1;
			d2_valid_96_1 <= d1_valid_96_1;
		end
	//output
	assign ofdm_resource_ext = (d2_valid_96_0 ? douta0:0) | (d2_valid_96_1 ? douta1:0);
	assign ofdm_resource_ext_valid = d2_valid_96_0 | d2_valid_96_1;
			
endmodule


//extend module
module extend_valid_new #(parameter number_cycles=100)(
		input clk,
		input rst,
		input i_pulse,
		output o_valid
	);
	reg [$clog2(number_cycles)-1:0] cnt;
	reg  valid;
	always @(posedge clk)
		if (rst) begin
			cnt <= 0;
			valid <= 0;
		end
		else begin
			if (i_pulse & cnt < number_cycles-2)
				valid <= 1;
			else if (cnt >= number_cycles-2)
				valid <= 0;
			if (valid)
				cnt <= cnt +1 ;
			else if (cnt >= number_cycles-2)
				cnt <= 0;
		end
	assign o_valid = valid|i_pulse;
endmodule
//falling edge 
module  falling_edge (
		input clk,
		input rst,
		input in,
		input out
	);
	reg reg_in;
	always @(posedge clk)
		if (rst)
			reg_in <= 0;
		else
			reg_in <= in;
	assign out = !in & reg_in ;
endmodule 