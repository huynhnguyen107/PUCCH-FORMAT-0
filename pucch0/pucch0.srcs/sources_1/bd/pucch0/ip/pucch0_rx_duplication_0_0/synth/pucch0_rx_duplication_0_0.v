// (c) Copyright 1995-2026 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:rx_duplication:1.0
// IP Revision: 4

(* X_CORE_INFO = "rx_duplication,Vivado 2019.2" *)
(* CHECK_LICENSE_TYPE = "pucch0_rx_duplication_0_0,rx_duplication,{}" *)
(* CORE_GENERATION_INFO = "pucch0_rx_duplication_0_0,rx_duplication,{x_ipProduct=Vivado 2019.2,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=rx_duplication,x_ipVersion=1.0,x_ipCoreRevision=4,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,RX_num=8}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module pucch0_rx_duplication_0_0 (
  clk,
  rst,
  resource_set0,
  resource_set1,
  two_symbol_valid,
  in_ofdm,
  ofdm_resource_ext,
  ofdm_resource_ext_valid
);

input wire clk;
input wire rst;
input wire resource_set0;
input wire resource_set1;
input wire two_symbol_valid;
input wire [255 : 0] in_ofdm;
output wire [255 : 0] ofdm_resource_ext;
output wire ofdm_resource_ext_valid;

  rx_duplication #(
    .RX_num(8)
  ) inst (
    .clk(clk),
    .rst(rst),
    .resource_set0(resource_set0),
    .resource_set1(resource_set1),
    .two_symbol_valid(two_symbol_valid),
    .in_ofdm(in_ofdm),
    .ofdm_resource_ext(ofdm_resource_ext),
    .ofdm_resource_ext_valid(ofdm_resource_ext_valid)
  );
endmodule
