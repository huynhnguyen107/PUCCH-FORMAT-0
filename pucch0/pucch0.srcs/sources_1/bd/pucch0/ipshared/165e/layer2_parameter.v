`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/29/2025 12:15:19 AM
// Design Name: layer2_parameter
// Module Name: layer2_parameter
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  mapping layer2 parameter
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module layer2_parameter(
	input clk,
	input rst,
	input layer2_valid,
	input [511:0] layer2_para,
	output reg uci_valid,
	output reg [15:0] uci_rnti,
	output reg [15:0] uci_nid,
	output reg [7:0] uci_srflag,
	output reg [7:0] uci_frist_symbol,
	output reg [15:0] uci_pbr_offset,
	output reg [15:0] uci_second_prb,
	output reg [15:0] uci_prb,
	output reg [7:0] uci_symbol,
	output reg [7:0] uci_intra_fre_hopping,
	output reg [15:0] uci_m0,
	output reg [15:0] uci_ack
    );
	always @(posedge clk)
		if (rst) begin
			uci_valid <= 0;
			uci_rnti <= 0;
			uci_nid <= 0;
			uci_srflag <= 0;
			uci_frist_symbol <= 0;
			uci_pbr_offset <= 0;
			uci_second_prb <= 0;
			uci_prb <= 0;
			uci_symbol <= 0;
			uci_intra_fre_hopping <= 0;
			uci_m0 <= 0;
			uci_ack <= 0;
		end
		else begin
			if (layer2_valid) begin
				uci_rnti <= layer2_para[79:64];
				uci_nid <= layer2_para[175:160];
				uci_srflag <= layer2_para[198:192];
				uci_frist_symbol <= layer2_para[207:200];
				uci_pbr_offset <= layer2_para[223:208];
				uci_second_prb <= layer2_para[239:224];
				uci_prb <= layer2_para[255:240];
				uci_symbol <= layer2_para[263:256];
				uci_intra_fre_hopping <= layer2_para[271:264];
				uci_m0 <= layer2_para[287:272];
				uci_ack <= layer2_para[367:352];	
			end
			uci_valid <= layer2_valid;
		end
			
endmodule
