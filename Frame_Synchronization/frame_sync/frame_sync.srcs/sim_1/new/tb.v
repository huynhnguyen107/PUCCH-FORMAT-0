`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2025 05:54:52 PM
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb(
    );
	reg clk, rst, i_trigger_05;
	wire [7:0] slot_idx;
	wire      start_slot;
	wire [8:0] sub_idx;
	wire [7:0] rb_idx;
	wire start_rb;
	wire [7:0] sym_idx;
	wire start_symbol;
	wire [7:0] frame_idx;
	wire     start_frame;
	wire start_subframe;
	wire  valid;
	// instance frame synchronozation
	frame_sync frame_sync_0(clk, rst, i_trigger_05, slot_idx, start_slot, sub_idx, 
							rb_idx, start_rb, sym_idx, start_symbol, frame_idx, start_frame, start_subframe,
							valid
								);
	//init rst, clk, i_trigger_05
	initial begin
		clk =0;
		rst =1;
		i_trigger_05 =0;
		#50 rst =0;
	end
	// clock
	always #0.5 clk =~clk;
	//i_trigger_05
	initial begin
		wait (!rst)
		@(posedge clk) i_trigger_05 <=1;
		@(posedge clk) i_trigger_05 <=0;
	end
endmodule
