`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/29/2025 10:24:59 PM
// Design Name: 
// Module Name: tb
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  full pucch0 integration that just has 1 rx only
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb();
  // ===== Clock & reset =====
  reg clk;                 
  reg clk;                 
  reg rst;                       
  reg [7:0] i_group_hopping;                 
  reg [15:0]i_hopping_ID;         
  reg i_config_valid;        
  reg [511:0]ulcch_para;         
  reg i_pucch_valid;         
  reg strop_request_trigger;         
  reg trigger_05ms;     
  wire [255:0] ant_input;                      
  wire [511:0] ulcch_para_tmp;                      
  // create rst and initial others
  initial begin
	rst=1;
	clk=0;
	i_group_hopping=0;
	i_hopping_ID=0;
	ulcch_para=0;
	i_pucch_valid=0;
	i_config_valid=0;
	strop_request_trigger=0;
	trigger_05ms=0;
	i_imag_pucch_ofdm=0;
	i_real_pucch_ofdm=0;
	#50
	rst=0;
  end	
 // create Clock
 always #0.5 clk=!clk;

  reg signed [15:0] i_imag_pucch_ofdm, i_real_pucch_ofdm;  
  // loaded from files
  localparam integer NUM_SAMPLES = 2457600;  

  reg [15:0] I_mem [0:NUM_SAMPLES-1];  
  reg [15:0] Q_mem [0:NUM_SAMPLES-1];  
  integer idx=0;
  integer n, cycle, slot;
  initial begin
    $readmemh("D:/5G/send_bang/genarate_data_PUCCH_100MHz/genarate_data_PUCCH_100MHz/16_15convert/I.mem", I_mem);
    $readmemh("D:/5G/send_bang/genarate_data_PUCCH_100MHz/genarate_data_PUCCH_100MHz/16_15convert/Q.mem", Q_mem);
  end
  assign ant_input = {8{i_imag_pucch_ofdm, i_real_pucch_ofdm}};
  pucch0_wrapper pucch0_wrapper (
    .clk (clk),
	.rst(rst),
	.trigger_05ms(trigger_05ms),
	.strop_request_trigger(strop_request_trigger),
	.i_pucch_valid(i_pucch_valid),
	.ulcch_para(ulcch_para),
	.i_config_valid(i_config_valid),
	.i_hopping_ID(i_hopping_ID),
	.i_group_hopping(i_group_hopping),
	.ant_input(ant_input),
	.mcs(mcs),
	.ack(ack)
  );
// uci_slot_idx <= ulcch_para[7:0];	
// uci_rnti <= ulcch_para[79:64];
// uci_nid <= ulcch_para[175:160];
// uci_srflag <= ulcch_para[199:192];
// uci_frist_symbol <= ulcch_para[207:200];
// uci_pbr_offset <= ulcch_para[223:208];
// uci_second_prb <= ulcch_para[239:224];
// uci_prb <= ulcch_para[255:240];
// uci_symbol <= ulcch_para[263:256];
// uci_intra_fre_hopping <= ulcch_para[271:264];
// uci_m0 <= ulcch_para[287:272];
// uci_ack <= ulcch_para[367:352];	
  // assign ulcch_para_tmp = {
	// 144'd17,//null
	// 16'd16,//ack
	// 64'd15,//null
	// 16'd14,//m0
	// 8'd13,//fre_hop
	// 8'd12,//symbol
	// 16'd11,//prb
	// 16'd10,//uci_second_prb
	// 16'd9,//uci_pbr_offset
	// 8'd8,//uci_frist_symbol
	// 8'd7,//uci_srflag
	// 16'd6,//	null_1
	// 16'd5,//uci_nid
	// 80'd4,//null_2
	// 16'd3,//uci_rnti
	// 56'd2,//null_3
	// 8'd1//uci_slot_idx
  // };


  assign ulcch_para_tmp = idx >1 ? {
	144'd0,//null
	16'd2,//ack
	64'd0,//null
	16'd0,//m0
	8'd1,//fre_hop
	8'd2,//symbol
	16'd1,//prb
	16'd272,//uci_second_prb
	16'd0,//uci_pbr_offset
	8'd0,//uci_frist_symbol
	8'd0,//uci_srflag
	16'd0,//	null_1
	16'd0,//uci_nid
	80'd0,//null_2
	16'd0,//uci_rnti
	56'd0,//null_3
	8'd9//uci_slot_idx
  }: {
	144'd0,//null
	16'd2,//ack
	64'd0,//null
	16'd0,//m0
	8'd1,//fre_hop
	8'd2,//symbol
	16'd1,//prb
	16'd272,//uci_second_prb
	16'd0,//uci_pbr_offset
	8'd0,//uci_frist_symbol
	8'd0,//uci_srflag
	16'd0,//	null_1
	16'd0,//uci_nid
	80'd0,//null_2
	16'd0,//uci_rnti
	56'd0,//null_3
	8'd4//uci_slot_idx
  };
  initial begin
	wait(!rst); 
	@(posedge clk) begin
		i_group_hopping <=1;
		i_hopping_ID <=35;
		i_config_valid <=1;
		ulcch_para <=ulcch_para_tmp;
		i_pucch_valid <=1;
		strop_request_trigger <=0;
		trigger_05ms <=0;
		i_real_pucch_ofdm <=0;
		i_imag_pucch_ofdm <=0;
		end
	@(posedge clk) begin
		i_group_hopping <=0;
		i_hopping_ID <=0;
		i_config_valid <=0;
		ulcch_para <=0;
		i_pucch_valid <=0;
		strop_request_trigger <=0;
		trigger_05ms <=0;
		end
	for (idx = 0; idx < 500; idx = idx + 1) 
        @(posedge clk);
		
    for (idx = 0; idx < NUM_SAMPLES; idx = idx + 1) begin
      @(posedge clk) begin
	  
			if (idx % 61440==0)
			   trigger_05ms <= 1;
			else
			   trigger_05ms <= 0;
			   
			if (idx>=6) begin
				i_real_pucch_ofdm <= I_mem[idx-6];
				i_imag_pucch_ofdm <= Q_mem[idx-6];
				end
		
			if (idx % (61440*5)==0 & idx>0) begin
				i_group_hopping <=1;
				i_hopping_ID <=35;
				i_config_valid <=1;
				ulcch_para <=ulcch_para_tmp;
				i_pucch_valid <=1;
				strop_request_trigger <=0;
			end
			else begin
				i_group_hopping <=0;
				i_hopping_ID <=0;
				i_config_valid <=0;
				ulcch_para <=0;
				i_pucch_valid <=0;
				strop_request_trigger <=0;
			end
		end
    end
  
  
  end

  // ===== Optional waveform dump =====
  // initial begin
    // $dumpfile("tb_fft.vcd");
    // $dumpvars(0, tb);
  // end

endmodule

