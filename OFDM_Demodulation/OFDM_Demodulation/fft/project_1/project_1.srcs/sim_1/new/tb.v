`timescale 1ns / 1ps
module tb();
	//clock & reset
	reg clk, rst;
	//input
	reg i_fwd, i_trigger_cp,  i_start_symbol;
	reg [15:0] i_imag_pucch_ofdm,  i_real_pucch_ofdm;
	
	//generate 100MHz clk (10ns period)
	initial clk =0;
	always #5 clk = ~clk;
	//reset active high
	initial begin
		#0 rst =1; i_fwd =0; i_trigger_cp=0; i_start_symbol=0;
		#100 rst =0;
	end
	//instance fft
	fft fft_v0(clk, rst, i_fwd, i_trigger_cp, i_start_symbol, i_imag_pucch_ofdm, i_real_pucch_ofdm, 
				o_imag_pucch_ofdm, o_real_pucch_ofdm, o_valid);
	
	
	//stimulation of data
	initial begin
		wait (!rst); 
		@(posedge clk) begin
			i_fwd <= 1;
			i_trigger_cp <= 1;
			i_start_symbol <= 1;
		end
		@(posedge clk) begin
			i_fwd <= 0;
			i_trigger_cp <= 0;
			i_start_symbol <= 0;
		end
		#44960;
		$finish;
	end

endmodule
