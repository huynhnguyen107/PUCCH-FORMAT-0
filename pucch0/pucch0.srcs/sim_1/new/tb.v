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
  reg rst;                       
  reg [7:0] slot_ind;                 
  reg [7:0]group_hopping;         
  reg [511:0]layer2_para;         
  reg layer2_valid;         
  reg strop_request_trigger;         
  reg trigger_05ms;     
  wire [255:0] ant_input;             
  // create rst and initial others
  initial begin
	rst=1;
	clk=0;
	slot_ind=0;
	group_hopping=0;
	layer2_para=0;
	layer2_valid=0;
	strop_request_trigger=0;
	trigger_05ms=0;
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
  integer idx;
  integer n, cycle, slot;
  initial begin
    $readmemh("D:/5G/send_bang/genarate_data_PUCCH_100MHz/genarate_data_PUCCH_100MHz/16_15convert/I.mem", I_mem);
    $readmemh("D:/5G/send_bang/genarate_data_PUCCH_100MHz/genarate_data_PUCCH_100MHz/16_15convert/Q.mem", Q_mem);
  end
  assign ant_input = {8{i_imag_pucch_ofdm, i_real_pucch_ofdm}};
  pucch0_wrapper pucch0_wrapper (
    .clk (clk),
    .rst(rst), 
    .ant_input(ant_input),
    .slot_ind(slot_ind),
    .group_hopping(group_hopping),
    .layer2_para (layer2_para),
    .layer2_valid (layer2_valid),
    .strop_request_trigger(strop_request_trigger),
    .trigger_05ms(trigger_05ms)
  );

  
  initial begin
	wait(!rst); 
	@(posedge clk) begin
		slot_ind <=4;
		group_hopping <=1;
		layer2_para <=0;
		layer2_valid <=1;
		strop_request_trigger <=0;
		trigger_05ms <=0;
		i_real_pucch_ofdm <=0;
		i_imag_pucch_ofdm <=0;
		end
	@(posedge clk) begin
		slot_ind <=0;
		group_hopping <=0;
		layer2_para <=0;
		layer2_valid <=0;
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
		end
    end
  
  
  end

  // ===== Optional waveform dump =====
  // initial begin
    // $dumpfile("tb_fft.vcd");
    // $dumpvars(0, tb);
  // end

endmodule

