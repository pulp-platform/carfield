
################################################################
# This is a generated script based on design: design_1
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
set scripts_vivado_version 2020.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcvu9p-flga2104-2L-e
   set_property BOARD_PART xilinx.com:vcu118:part0:2.4 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

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
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

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

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
ethz.ch:user:carfield_xilinx_ip:1.0\
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:ddr4:2.2\
xilinx.com:ip:xlconstant:1.1\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:util_ds_buf:2.1\
xilinx.com:ip:vio:3.0\
xilinx.com:ip:smartconnect:1.0\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
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
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set ddr4_sdram_c1_062 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 ddr4_sdram_c1_062 ]

  set default_250mhz_clk1 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 default_250mhz_clk1 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {250000000} \
   ] $default_250mhz_clk1

  set default_sysclk1_300 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 default_sysclk1_300 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {300000000} \
   ] $default_sysclk1_300


  # Create ports
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $reset
  set uart_rx_i [ create_bd_port -dir I uart_rx_i ]
  set uart_tx_o [ create_bd_port -dir O uart_tx_o ]

  # Create instance: carfield_xilinx_ip_0, and set properties
  set carfield_xilinx_ip_0 [ create_bd_cell -type ip -vlnv ethz.ch:user:carfield_xilinx_ip:1.0 carfield_xilinx_ip_0 ]

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKIN1_JITTER_PS {33.330000000000005} \
   CONFIG.CLKOUT1_JITTER {160.570} \
   CONFIG.CLKOUT1_PHASE_ERROR {77.836} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {10.000} \
   CONFIG.CLKOUT1_USED {true} \
   CONFIG.CLKOUT2_JITTER {140.023} \
   CONFIG.CLKOUT2_PHASE_ERROR {77.836} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {20.000} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLKOUT3_JITTER {116.415} \
   CONFIG.CLKOUT3_PHASE_ERROR {77.836} \
   CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {50.000} \
   CONFIG.CLKOUT3_USED {true} \
   CONFIG.CLKOUT4_JITTER {101.475} \
   CONFIG.CLKOUT4_PHASE_ERROR {77.836} \
   CONFIG.CLKOUT4_USED {true} \
   CONFIG.CLK_IN1_BOARD_INTERFACE {Custom} \
   CONFIG.CLK_OUT1_PORT {clk_10} \
   CONFIG.CLK_OUT2_PORT {clk_20} \
   CONFIG.CLK_OUT3_PORT {clk_50} \
   CONFIG.CLK_OUT4_PORT {clk_100} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {4.000} \
   CONFIG.MMCM_CLKIN1_PERIOD {3.333} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {120.000} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {60} \
   CONFIG.MMCM_CLKOUT2_DIVIDE {24} \
   CONFIG.MMCM_CLKOUT3_DIVIDE {12} \
   CONFIG.MMCM_DIVCLK_DIVIDE {1} \
   CONFIG.NUM_OUT_CLKS {4} \
   CONFIG.PRIM_SOURCE {No_buffer} \
   CONFIG.RESET_BOARD_INTERFACE {Custom} \
   CONFIG.USE_BOARD_FLOW {true} \
   CONFIG.USE_RESET {false} \
 ] $clk_wiz_0

  # Create instance: ddr4_0, and set properties
  set ddr4_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ddr4:2.2 ddr4_0 ]
  set_property -dict [ list \
   CONFIG.ADDN_UI_CLKOUT1_FREQ_HZ {None} \
   CONFIG.C0.BANK_GROUP_WIDTH {1} \
   CONFIG.C0.DDR4_AxiAddressWidth {31} \
   CONFIG.C0.DDR4_AxiDataWidth {512} \
   CONFIG.C0.DDR4_CLKOUT0_DIVIDE {5} \
   CONFIG.C0.DDR4_CasWriteLatency {12} \
   CONFIG.C0.DDR4_DataWidth {64} \
   CONFIG.C0.DDR4_InputClockPeriod {4000} \
   CONFIG.C0.DDR4_MemoryPart {MT40A256M16LY-062E} \
   CONFIG.C0.DDR4_TimePeriod {833} \
   CONFIG.C0_CLOCK_BOARD_INTERFACE {default_250mhz_clk1} \
   CONFIG.C0_DDR4_BOARD_INTERFACE {ddr4_sdram_c1_062} \
   CONFIG.RESET_BOARD_INTERFACE {reset} \
 ] $ddr4_0

  # Create instance: high, and set properties
  set high [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 high ]

  # Create instance: low, and set properties
  set low [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 low ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $low

  # Create instance: psr_10, and set properties
  set psr_10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 psr_10 ]
  set_property -dict [ list \
   CONFIG.C_AUX_RESET_HIGH {1} \
   CONFIG.RESET_BOARD_INTERFACE {reset} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $psr_10

  # Create instance: util_ds_buf_0, and set properties
  set util_ds_buf_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_0 ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {IBUFDS} \
   CONFIG.DIFF_CLK_IN_BOARD_INTERFACE {default_sysclk1_300} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $util_ds_buf_0

  # Create instance: vio_0, and set properties
  set vio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:vio:3.0 vio_0 ]
  set_property -dict [ list \
   CONFIG.C_EN_PROBE_IN_ACTIVITY {0} \
   CONFIG.C_NUM_PROBE_IN {0} \
   CONFIG.C_NUM_PROBE_OUT {3} \
   CONFIG.C_PROBE_OUT0_INIT_VAL {0x2} \
   CONFIG.C_PROBE_OUT0_WIDTH {2} \
   CONFIG.C_PROBE_OUT1_INIT_VAL {0x2} \
   CONFIG.C_PROBE_OUT1_WIDTH {2} \
 ] $vio_0

  # Create instance: xbar_dram, and set properties
  set xbar_dram [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 xbar_dram ]
  set_property -dict [ list \
   CONFIG.HAS_ARESETN {1} \
   CONFIG.NUM_CLKS {2} \
   CONFIG.NUM_SI {1} \
 ] $xbar_dram

  # Create interface connections
  connect_bd_intf_net -intf_net carfield_xilinx_ip_0_dram_axi [get_bd_intf_pins carfield_xilinx_ip_0/dram_axi] [get_bd_intf_pins xbar_dram/S00_AXI]
  connect_bd_intf_net -intf_net ddr4_0_C0_DDR4 [get_bd_intf_ports ddr4_sdram_c1_062] [get_bd_intf_pins ddr4_0/C0_DDR4]
  connect_bd_intf_net -intf_net default_250mhz_clk1_1 [get_bd_intf_ports default_250mhz_clk1] [get_bd_intf_pins ddr4_0/C0_SYS_CLK]
  connect_bd_intf_net -intf_net default_sysclk1_300_1 [get_bd_intf_ports default_sysclk1_300] [get_bd_intf_pins util_ds_buf_0/CLK_IN_D]
  connect_bd_intf_net -intf_net xbar_dram_M00_AXI [get_bd_intf_pins ddr4_0/C0_DDR4_S_AXI] [get_bd_intf_pins xbar_dram/M00_AXI]

  # Create port connections
  connect_bd_net -net carfield_xilinx_ip_0_dram_axi_m_aclk [get_bd_pins carfield_xilinx_ip_0/dram_axi_m_aclk] [get_bd_pins xbar_dram/aclk]
  connect_bd_net -net carfield_xilinx_ip_0_uart_tx_o [get_bd_ports uart_tx_o] [get_bd_pins carfield_xilinx_ip_0/uart_tx_o]
  connect_bd_net -net clk_wiz_0_clk_10 [get_bd_pins carfield_xilinx_ip_0/clk_10] [get_bd_pins clk_wiz_0/clk_10] [get_bd_pins psr_10/slowest_sync_clk]
  connect_bd_net -net clk_wiz_0_clk_20 [get_bd_pins carfield_xilinx_ip_0/clk_20] [get_bd_pins clk_wiz_0/clk_20]
  connect_bd_net -net clk_wiz_0_clk_50 [get_bd_pins carfield_xilinx_ip_0/clk_50] [get_bd_pins clk_wiz_0/clk_50] [get_bd_pins vio_0/clk]
  connect_bd_net -net clk_wiz_0_clk_100 [get_bd_pins carfield_xilinx_ip_0/clk_100] [get_bd_pins clk_wiz_0/clk_100]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk [get_bd_pins ddr4_0/c0_ddr4_ui_clk] [get_bd_pins xbar_dram/aclk1]
  connect_bd_net -net high_dout [get_bd_pins carfield_xilinx_ip_0/jtag_trst_ni] [get_bd_pins high/dout]
  connect_bd_net -net low_dout [get_bd_pins carfield_xilinx_ip_0/testmode_i] [get_bd_pins low/dout]
  connect_bd_net -net psr_10_interconnect_aresetn [get_bd_pins psr_10/interconnect_aresetn] [get_bd_pins xbar_dram/aresetn]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins carfield_xilinx_ip_0/cpu_reset] [get_bd_pins ddr4_0/sys_rst] [get_bd_pins psr_10/ext_reset_in]
  connect_bd_net -net uart_rx_i_1 [get_bd_ports uart_rx_i] [get_bd_pins carfield_xilinx_ip_0/uart_rx_i]
  connect_bd_net -net util_ds_buf_0_IBUF_OUT [get_bd_pins clk_wiz_0/clk_in1] [get_bd_pins util_ds_buf_0/IBUF_OUT]
  connect_bd_net -net vio_0_probe_out0 [get_bd_pins carfield_xilinx_ip_0/boot_mode_i] [get_bd_pins vio_0/probe_out0]
  connect_bd_net -net vio_0_probe_out1 [get_bd_pins carfield_xilinx_ip_0/boot_mode_safety_i] [get_bd_pins vio_0/probe_out1]
  connect_bd_net -net vio_0_probe_out2 [get_bd_pins psr_10/aux_reset_in] [get_bd_pins vio_0/probe_out2]

  # Create address segments
  assign_bd_address -offset 0x80000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces carfield_xilinx_ip_0/dram_axi] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force


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


