`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 11/23/2025 08:29:40 PM
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
		input [11:0] trigger_cp,
		//uci from layer 2
		input [1:0] uci_instra_fre_hop,
		input [15:0] uci_first_subcarrier,
		input [3:0] uci_nsc,
		input [2:0] uci_nsymbols,
		input [3:0] uci_first_symbol_idx,
		input [1:0] uci_prbsoffset,
		input [1:0] uci_secondhop_prb,
		// from synchronous frame
    );
endmodule
