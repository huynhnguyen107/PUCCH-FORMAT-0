`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/23/2025 08:29:40 PM
// Design Name: Resource Demapping
// Module Name: mapping
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  FFT
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module demapping(
		input clk,
		input rst,
		//uci from layer 2
		input       uci_instra_fre_hop,
		input [4:0] uci_slot,
		input [1:0] uci_nsymbols,
		input [3:0] uci_first_symbol_idx,
		input [1:0] uci_prbsoffset,
		input [9:0] uci_secondhop_prb,
		input  uci_valid,
		// from synchronous frame
		input [4:0] fr_slot,
		input [3:0] fr_symbol,
		input [8:0] fr_rb,
		input  fr_data_valid,
		output resoureset0_valid,
		output resoureset1_valid,
		output two_symbol_valid
    );
	//definition
	wire uci_ex_valid;
	wire valid;
	//reg enable
	reg slot_valid;
	reg symbol_valid;
	reg rb_valid;
	reg second_symbol_valid;
	reg second_rb_valid;
	reg two_symbol_valid_temp;
	reg fre_hopping_valid;
	// resource set
	wire resource_set0;
	wire resource_set1;
	wire h_resource_set0;
	wire h_resource_set1;
	wire final_resource_set0;
	wire final_resource_set1;
	wire edge_resource_set0;
	wire edge_resource_set1;
	wire d_resource_set0;
	wire d_resource_set1;
	//extend valid to 3 slot
	extend_valid_new #(184320) extend_valid_0(clk, rst, uci_valid, uci_ex_valid);
	assign valid = uci_ex_valid & fr_data_valid;
	// logic checks
	always @(posedge clk)
		if (rst) begin
			slot_valid <= 0;
			symbol_valid <= 0;
			rb_valid <= 0;
			second_symbol_valid <= 0;
			second_rb_valid <= 0;
			two_symbol_valid_temp <= 0;
			fre_hopping_valid <= 0;
		end
		else begin
			slot_valid <= valid ? uci_slot == fr_slot : slot_valid;
			symbol_valid <= valid ? uci_first_symbol_idx == fr_symbol  : symbol_valid;
			rb_valid <= valid ? uci_prbsoffset == fr_rb  : rb_valid;
			second_symbol_valid <= valid ? (uci_first_symbol_idx + 1) == fr_symbol  : second_symbol_valid;
			second_rb_valid <= valid ? (uci_prbsoffset + uci_secondhop_prb) == fr_rb  : second_rb_valid;
			two_symbol_valid_temp <= valid ? uci_nsymbols == 2'd1  : two_symbol_valid_temp;
			fre_hopping_valid <= valid ?  uci_instra_fre_hop == 1'b1  : fre_hopping_valid;
		end
		//assign all conditions
		//case 1 no-hopping
		assign resource_set0 = slot_valid & symbol_valid & rb_valid;
		assign resource_set1 = slot_valid & second_symbol_valid & rb_valid;
		//case 1 hopping
		assign h_resource_set0 = resource_set0;
		assign h_resource_set1 = slot_valid & second_symbol_valid & second_rb_valid;
		//selection hopping or no-hopping
		assign final_resource_set0 = fre_hopping_valid ? h_resource_set0: resource_set0;
		assign final_resource_set1 = fre_hopping_valid ? h_resource_set1: resource_set1;
		//calib delays and 12 cyclyes
		//rasing edge
		rasing_edge rasing_edge_0(clk, rst, final_resource_set0, edge_resource_set0 );
		rasing_edge rasing_edge_1(clk, rst, final_resource_set1, edge_resource_set1 );
		//calib delays
		delay_N #(10, 1)delay_N_0 (clk, rst, edge_resource_set0, d_resource_set0 );
		delay_N #(10, 1)delay_N_1 (clk, rst, edge_resource_set1, d_resource_set1 );
		//extend 12 cyclyes=1rb
		extend_valid_new #(12) extend_valid_1(clk, rst, d_resource_set0,  resoureset0_valid);
		extend_valid_new #(12) extend_valid_2(clk, rst, d_resource_set1,  resoureset1_valid);
		assign two_symbol_valid = two_symbol_valid_temp;
		
endmodule

//delay module
module delay_N #(parameter N=10, WIDTH=16)(
			input clk,
			input rst,
			input [WIDTH-1:0] in,
			output [WIDTH-1:0] out
				);
	reg [WIDTH-1:0] delay_reg [0:N-1];
	integer i;
	always @(posedge clk)
		if (rst) 
			for (i=0; i<N; i=i+1)
				delay_reg [i] <= 0;
		else begin	
			delay_reg[0] <= in;
			for (i=1; i<N; i=i+1)
				delay_reg [i] <= delay_reg [i-1];
		end
	assign out = delay_reg [N-1];
			
endmodule


//rasing edge 
module  rasing_edge (
		input clk,
		input rst,
		input in,
		input out
	);
	reg reg_not_in;
	always @(posedge clk)
		if (rst)
			reg_not_in <= 1;
		else
			reg_not_in <= !in;
	assign out = in & reg_not_in ;
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