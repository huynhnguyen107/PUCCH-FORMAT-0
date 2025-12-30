
################################################################
# This is a generated script based on design: pucch0
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2019.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source pucch0_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcvu9p-flga2104-2L-e
   set_property BOARD_PART xilinx.com:vcu118:part0:2.3 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name pucch0

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set ack [ create_bd_port -dir O -from 1 -to 0 ack ]
  set ant_input [ create_bd_port -dir I -from 255 -to 0 ant_input ]
  set clk [ create_bd_port -dir I -type clk -freq_hz 122880000 clk ]
  set group_hopping [ create_bd_port -dir I -from 7 -to 0 group_hopping ]
  set layer2_para [ create_bd_port -dir I -from 511 -to 0 -type data layer2_para ]
  set layer2_valid [ create_bd_port -dir I layer2_valid ]
  set mcs [ create_bd_port -dir O -from 3 -to 0 mcs ]
  set out_valid [ create_bd_port -dir O out_valid ]
  set rst [ create_bd_port -dir I -type rst rst ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $rst
  set slot_ind [ create_bd_port -dir I -from 7 -to 0 slot_ind ]
  set strop_request_trigger [ create_bd_port -dir I strop_request_trigger ]
  set trigger_05ms [ create_bd_port -dir I trigger_05ms ]

  # Create instance: combine_rx_sym_0, and set properties
  set combine_rx_sym_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:combine_rx_sym:1.0 combine_rx_sym_0 ]

  # Create instance: correlation_0, and set properties
  set correlation_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:correlation:1.0 correlation_0 ]

  # Create instance: cyclic_gen_0, and set properties
  set cyclic_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:cyclic_gen:1.0 cyclic_gen_0 ]

  # Create instance: cyclic_gen_1, and set properties
  set cyclic_gen_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:cyclic_gen:1.0 cyclic_gen_1 ]

  # Create instance: demapping_0, and set properties
  set demapping_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:demapping:1.0 demapping_0 ]

  # Create instance: frame_sync_0, and set properties
  set frame_sync_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:frame_sync:1.0 frame_sync_0 ]

  # Create instance: frame_sync_1, and set properties
  set frame_sync_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:frame_sync:1.0 frame_sync_1 ]

  # Create instance: layer2_parameter_0, and set properties
  set layer2_parameter_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:layer2_parameter:1.0 layer2_parameter_0 ]

  # Create instance: ofdm_demodulation_0, and set properties
  set ofdm_demodulation_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:ofdm_demodulation:1.0 ofdm_demodulation_0 ]

  # Create instance: peak_search_0, and set properties
  set peak_search_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:peak_search:1.0 peak_search_0 ]

  # Create instance: physical_control_0, and set properties
  set physical_control_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:physical_control:1.0 physical_control_0 ]

  # Create instance: rx_duplication_0, and set properties
  set rx_duplication_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:rx_duplication:1.0 rx_duplication_0 ]
  set_property -dict [ list \
   CONFIG.RX_num {8} \
 ] $rx_duplication_0

  # Create instance: sync_cyclic_0, and set properties
  set sync_cyclic_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:sync_cyclic:1.0 sync_cyclic_0 ]

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
   CONFIG.IN0_WIDTH {32} \
   CONFIG.IN1_WIDTH {32} \
   CONFIG.IN2_WIDTH {32} \
   CONFIG.IN3_WIDTH {32} \
   CONFIG.IN4_WIDTH {32} \
   CONFIG.IN5_WIDTH {32} \
   CONFIG.IN6_WIDTH {32} \
   CONFIG.IN7_WIDTH {32} \
   CONFIG.NUM_PORTS {8} \
 ] $xlconcat_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {1} \
 ] $xlconstant_1

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {4} \
   CONFIG.CONST_WIDTH {3} \
 ] $xlconstant_2

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {15} \
   CONFIG.DIN_TO {0} \
   CONFIG.DIN_WIDTH {256} \
   CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_0

  # Create port connections
  connect_bd_net -net ant_input_1 [get_bd_ports ant_input] [get_bd_pins xlslice_0/Din]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins combine_rx_sym_0/clk] [get_bd_pins correlation_0/clk] [get_bd_pins cyclic_gen_0/clk] [get_bd_pins cyclic_gen_1/clk] [get_bd_pins demapping_0/clk] [get_bd_pins frame_sync_0/clk] [get_bd_pins frame_sync_1/clk] [get_bd_pins layer2_parameter_0/clk] [get_bd_pins ofdm_demodulation_0/clk] [get_bd_pins peak_search_0/clk] [get_bd_pins physical_control_0/clk] [get_bd_pins rx_duplication_0/clk] [get_bd_pins sync_cyclic_0/clk]
  connect_bd_net -net combine_rx_sym_0_peak [get_bd_pins combine_rx_sym_0/peak] [get_bd_pins peak_search_0/peak]
  connect_bd_net -net combine_rx_sym_0_peak_valid [get_bd_pins combine_rx_sym_0/peak_valid] [get_bd_pins peak_search_0/peak_valid]
  connect_bd_net -net correlation_0_sqrt_valid [get_bd_pins combine_rx_sym_0/in_valid] [get_bd_pins correlation_0/sqrt_valid]
  connect_bd_net -net cyclic_gen_0_cyclic_shift [get_bd_pins cyclic_gen_0/cyclic_shift] [get_bd_pins sync_cyclic_0/cyclic_1]
  connect_bd_net -net cyclic_gen_0_cyclic_shift_valid [get_bd_pins cyclic_gen_0/cyclic_shift_valid] [get_bd_pins sync_cyclic_0/valid_1]
  connect_bd_net -net cyclic_gen_1_cyclic_shift [get_bd_pins cyclic_gen_1/cyclic_shift] [get_bd_pins sync_cyclic_0/cyclic_0]
  connect_bd_net -net cyclic_gen_1_cyclic_shift_valid [get_bd_pins cyclic_gen_1/cyclic_shift_valid] [get_bd_pins sync_cyclic_0/valid_0]
  connect_bd_net -net demapping_0_resoureset0_valid [get_bd_pins demapping_0/resoureset0_valid] [get_bd_pins rx_duplication_0/resource_set0]
  connect_bd_net -net demapping_0_resoureset1_valid [get_bd_pins demapping_0/resoureset1_valid] [get_bd_pins rx_duplication_0/resource_set1]
  connect_bd_net -net demapping_0_two_symbol_valid [get_bd_pins demapping_0/two_symbol_valid] [get_bd_pins rx_duplication_0/two_symbol_valid]
  connect_bd_net -net frame_sync_0_cp [get_bd_pins frame_sync_0/cp] [get_bd_pins ofdm_demodulation_0/i_trigger_cp]
  connect_bd_net -net frame_sync_0_start_symbol [get_bd_pins frame_sync_0/start_symbol] [get_bd_pins ofdm_demodulation_0/i_start_symbol]
  connect_bd_net -net frame_sync_1_rb_idx [get_bd_pins demapping_0/fr_rb] [get_bd_pins frame_sync_1/rb_idx]
  connect_bd_net -net frame_sync_1_slot_idx [get_bd_pins demapping_0/fr_slot] [get_bd_pins frame_sync_1/slot_idx]
  connect_bd_net -net frame_sync_1_sym_idx [get_bd_pins demapping_0/fr_symbol] [get_bd_pins frame_sync_1/sym_idx]
  connect_bd_net -net frame_sync_1_valid_out [get_bd_pins demapping_0/fr_data_valid] [get_bd_pins frame_sync_1/valid_out]
  connect_bd_net -net group_hopping_1 [get_bd_ports group_hopping] [get_bd_pins cyclic_gen_0/uci_grouphopping] [get_bd_pins cyclic_gen_1/uci_grouphopping]
  connect_bd_net -net layer2_para_1 [get_bd_ports layer2_para] [get_bd_pins layer2_parameter_0/layer2_para]
  connect_bd_net -net layer2_parameter_0_uci_ack [get_bd_pins cyclic_gen_0/uci_ack] [get_bd_pins cyclic_gen_1/uci_ack] [get_bd_pins layer2_parameter_0/uci_ack] [get_bd_pins peak_search_0/uci_ack]
  connect_bd_net -net layer2_parameter_0_uci_frist_symbol [get_bd_pins cyclic_gen_0/uci_first_symbol] [get_bd_pins cyclic_gen_1/uci_first_symbol] [get_bd_pins demapping_0/uci_first_symbol_idx] [get_bd_pins layer2_parameter_0/uci_frist_symbol]
  connect_bd_net -net layer2_parameter_0_uci_intra_fre_hopping [get_bd_pins demapping_0/uci_instra_fre_hop] [get_bd_pins layer2_parameter_0/uci_intra_fre_hopping]
  connect_bd_net -net layer2_parameter_0_uci_m0 [get_bd_pins cyclic_gen_0/uci_m0] [get_bd_pins cyclic_gen_1/uci_m0] [get_bd_pins layer2_parameter_0/uci_m0]
  connect_bd_net -net layer2_parameter_0_uci_nid [get_bd_pins cyclic_gen_0/uci_nID] [get_bd_pins cyclic_gen_1/uci_nID] [get_bd_pins layer2_parameter_0/uci_nid]
  connect_bd_net -net layer2_parameter_0_uci_pbr_offset [get_bd_pins demapping_0/uci_prbsoffset] [get_bd_pins layer2_parameter_0/uci_pbr_offset]
  connect_bd_net -net layer2_parameter_0_uci_second_prb [get_bd_pins demapping_0/uci_secondhop_prb] [get_bd_pins layer2_parameter_0/uci_second_prb]
  connect_bd_net -net layer2_parameter_0_uci_symbol [get_bd_pins demapping_0/uci_nsymbols] [get_bd_pins layer2_parameter_0/uci_symbol]
  connect_bd_net -net layer2_parameter_0_uci_valid [get_bd_pins cyclic_gen_0/in_valid] [get_bd_pins cyclic_gen_1/in_valid] [get_bd_pins demapping_0/uci_valid] [get_bd_pins layer2_parameter_0/uci_valid] [get_bd_pins peak_search_0/in_uci_valid]
  connect_bd_net -net layer2_valid_1 [get_bd_ports layer2_valid] [get_bd_pins layer2_parameter_0/layer2_valid]
  connect_bd_net -net ofdm_demodulation_0_start_symbol [get_bd_pins frame_sync_1/in_start_symbol] [get_bd_pins ofdm_demodulation_0/start_symbol]
  connect_bd_net -net ofdm_demodulation_v2_0_pucch_ofdm [get_bd_pins ofdm_demodulation_0/pucch_ofdm] [get_bd_pins xlconcat_0/In0] [get_bd_pins xlconcat_0/In1] [get_bd_pins xlconcat_0/In2] [get_bd_pins xlconcat_0/In3] [get_bd_pins xlconcat_0/In4] [get_bd_pins xlconcat_0/In5] [get_bd_pins xlconcat_0/In6] [get_bd_pins xlconcat_0/In7]
  connect_bd_net -net peak_search_0_ack [get_bd_ports ack] [get_bd_pins peak_search_0/ack]
  connect_bd_net -net peak_search_0_mcs [get_bd_ports mcs] [get_bd_pins peak_search_0/mcs]
  connect_bd_net -net peak_search_0_out_valid [get_bd_ports out_valid] [get_bd_pins peak_search_0/out_valid]
  connect_bd_net -net physical_control_0_start_symbol [get_bd_pins frame_sync_0/in_start_symbol] [get_bd_pins physical_control_0/start_symbol]
  connect_bd_net -net rst_1 [get_bd_ports rst] [get_bd_pins combine_rx_sym_0/rst] [get_bd_pins correlation_0/rst] [get_bd_pins cyclic_gen_0/rst] [get_bd_pins cyclic_gen_1/rst] [get_bd_pins demapping_0/rst] [get_bd_pins frame_sync_0/rst] [get_bd_pins frame_sync_1/rst] [get_bd_pins layer2_parameter_0/rst] [get_bd_pins ofdm_demodulation_0/rst] [get_bd_pins peak_search_0/rst] [get_bd_pins physical_control_0/rst] [get_bd_pins rx_duplication_0/rst] [get_bd_pins sync_cyclic_0/rst]
  connect_bd_net -net rx_duplication_0_ofdm_resource_ext_valid [get_bd_pins correlation_0/resourceset_valid] [get_bd_pins rx_duplication_0/ofdm_resource_ext_valid]
  connect_bd_net -net slot_ind_1 [get_bd_ports slot_ind] [get_bd_pins cyclic_gen_0/uci_slot] [get_bd_pins cyclic_gen_1/uci_slot] [get_bd_pins demapping_0/uci_slot]
  connect_bd_net -net strop_request_trigger_1 [get_bd_ports strop_request_trigger] [get_bd_pins physical_control_0/stop_request_trigger]
  connect_bd_net -net sync_cyclic_0_cyclic [get_bd_pins correlation_0/cyclic_shift] [get_bd_pins sync_cyclic_0/cyclic]
  connect_bd_net -net sync_cyclic_0_cyclic_valid [get_bd_pins correlation_0/cyclic_shift_valid] [get_bd_pins sync_cyclic_0/cyclic_valid]
  connect_bd_net -net trigger_05ms_1 [get_bd_ports trigger_05ms] [get_bd_pins physical_control_0/in_0_5ms]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins rx_duplication_0/in_ofdm] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins cyclic_gen_1/uci_nhop] [get_bd_pins cyclic_gen_1/uci_sym_alloc] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins cyclic_gen_0/uci_nhop] [get_bd_pins cyclic_gen_0/uci_sym_alloc] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins ofdm_demodulation_0/scale_factor] [get_bd_pins xlconstant_2/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins ofdm_demodulation_0/ant_input] [get_bd_pins xlslice_0/Dout]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


