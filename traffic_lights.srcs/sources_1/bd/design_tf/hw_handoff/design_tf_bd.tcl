
################################################################
# This is a generated script based on design: design_tf
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
# source design_tf_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg400-3
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_tf

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
  set LEDs0 [ create_bd_port -dir O -from 2 -to 0 LEDs0 ]
  set LEDs1 [ create_bd_port -dir O -from 2 -to 0 LEDs1 ]
  set LEDs2 [ create_bd_port -dir O -from 2 -to 0 LEDs2 ]
  set LEDs3 [ create_bd_port -dir O -from 2 -to 0 LEDs3 ]
  set anode0 [ create_bd_port -dir O -from 1 -to 0 anode0 ]
  set anode1 [ create_bd_port -dir O -from 1 -to 0 anode1 ]
  set anode2 [ create_bd_port -dir O -from 1 -to 0 anode2 ]
  set anode3 [ create_bd_port -dir O -from 1 -to 0 anode3 ]
  set cathode0 [ create_bd_port -dir O -from 7 -to 0 cathode0 ]
  set cathode1 [ create_bd_port -dir O -from 7 -to 0 cathode1 ]
  set cathode2 [ create_bd_port -dir O -from 7 -to 0 cathode2 ]
  set cathode3 [ create_bd_port -dir O -from 7 -to 0 cathode3 ]
  set ce [ create_bd_port -dir I ce ]
  set clk [ create_bd_port -dir I -type clk -freq_hz 100000000 clk ]
  set enable [ create_bd_port -dir I enable ]
  set greenLightTime [ create_bd_port -dir I -from 5 -to 0 greenLightTime ]
  set rst [ create_bd_port -dir I -type rst rst ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $rst

  # Create instance: TrafficLights_0, and set properties
  set TrafficLights_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:TrafficLights:1.0 TrafficLights_0 ]

  # Create instance: bin2digit2_0, and set properties
  set bin2digit2_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:bin2digit2:1.0 bin2digit2_0 ]

  # Create instance: bin2digit2_1, and set properties
  set bin2digit2_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:bin2digit2:1.0 bin2digit2_1 ]

  # Create instance: decoder_0, and set properties
  set decoder_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:decoder:1.0 decoder_0 ]

  # Create instance: kcpsm6_0, and set properties
  set kcpsm6_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:kcpsm6:1.0 kcpsm6_0 ]

  # Create instance: lightstoleds_0, and set properties
  set lightstoleds_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:lightstoleds:1.0 lightstoleds_0 ]

  # Create instance: mux2_1_0, and set properties
  set mux2_1_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:mux2_1:1.0 mux2_1_0 ]

  # Create instance: pamiec_procesora_0, and set properties
  set pamiec_procesora_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:pamiec_procesora:1.0 pamiec_procesora_0 ]

  # Create instance: top_7LED_0, and set properties
  set top_7LED_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:top_7LED:1.0 top_7LED_0 ]

  # Create instance: top_7LED_1, and set properties
  set top_7LED_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:top_7LED:1.0 top_7LED_1 ]

  # Create instance: top_7LED_2, and set properties
  set top_7LED_2 [ create_bd_cell -type ip -vlnv xilinx.com:user:top_7LED:1.0 top_7LED_2 ]

  # Create instance: top_7LED_3, and set properties
  set top_7LED_3 [ create_bd_cell -type ip -vlnv xilinx.com:user:top_7LED:1.0 top_7LED_3 ]

  # Create instance: top_diode_0, and set properties
  set top_diode_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:top_diode:1.0 top_diode_0 ]

  # Create instance: top_diode_1, and set properties
  set top_diode_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:top_diode:1.0 top_diode_1 ]

  # Create instance: top_diode_2, and set properties
  set top_diode_2 [ create_bd_cell -type ip -vlnv xilinx.com:user:top_diode:1.0 top_diode_2 ]

  # Create instance: top_diode_3, and set properties
  set top_diode_3 [ create_bd_cell -type ip -vlnv xilinx.com:user:top_diode:1.0 top_diode_3 ]

  # Create port connections
  connect_bd_net -net TrafficLights_0_lights [get_bd_pins TrafficLights_0/lights] [get_bd_pins lightstoleds_0/lights]
  connect_bd_net -net TrafficLights_0_timeLeftEW [get_bd_pins TrafficLights_0/timeLeftEW] [get_bd_pins bin2digit2_1/timeleftbin]
  connect_bd_net -net TrafficLights_0_timeLeftNS [get_bd_pins TrafficLights_0/timeLeftNS] [get_bd_pins bin2digit2_0/timeleftbin]
  connect_bd_net -net bin2digit2_0_timeleft [get_bd_pins bin2digit2_0/timeleft] [get_bd_pins top_7LED_0/switch] [get_bd_pins top_7LED_2/switch]
  connect_bd_net -net bin2digit2_1_timeleft [get_bd_pins bin2digit2_1/timeleft] [get_bd_pins top_7LED_1/switch] [get_bd_pins top_7LED_3/switch]
  connect_bd_net -net ce_1 [get_bd_ports ce] [get_bd_pins mux2_1_0/ce]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins TrafficLights_0/clk] [get_bd_pins decoder_0/clk] [get_bd_pins kcpsm6_0/clk] [get_bd_pins mux2_1_0/clk] [get_bd_pins pamiec_procesora_0/clk] [get_bd_pins top_7LED_0/clk] [get_bd_pins top_7LED_1/clk] [get_bd_pins top_7LED_2/clk] [get_bd_pins top_7LED_3/clk] [get_bd_pins top_diode_0/clk] [get_bd_pins top_diode_1/clk] [get_bd_pins top_diode_2/clk] [get_bd_pins top_diode_3/clk]
  connect_bd_net -net decoder_0_ce [get_bd_pins TrafficLights_0/ce] [get_bd_pins decoder_0/ce]
  connect_bd_net -net decoder_0_greenLightTime [get_bd_pins TrafficLights_0/greenLightTime] [get_bd_pins decoder_0/greenLightTime]
  connect_bd_net -net enable_1 [get_bd_ports enable] [get_bd_pins pamiec_procesora_0/enable]
  connect_bd_net -net greenLightTime_1 [get_bd_ports greenLightTime] [get_bd_pins mux2_1_0/greenLightTime]
  connect_bd_net -net kcpsm6_0_address [get_bd_pins kcpsm6_0/address] [get_bd_pins pamiec_procesora_0/address]
  connect_bd_net -net kcpsm6_0_out_port [get_bd_pins decoder_0/out_port] [get_bd_pins kcpsm6_0/out_port]
  connect_bd_net -net kcpsm6_0_port_id [get_bd_pins decoder_0/port_id] [get_bd_pins kcpsm6_0/port_id] [get_bd_pins mux2_1_0/port_id]
  connect_bd_net -net kcpsm6_0_write_strobe [get_bd_pins decoder_0/write_strobe] [get_bd_pins kcpsm6_0/write_strobe]
  connect_bd_net -net lightstoleds_0_lightEW [get_bd_pins lightstoleds_0/lightEW] [get_bd_pins top_diode_1/light] [get_bd_pins top_diode_3/light]
  connect_bd_net -net lightstoleds_0_lightNS [get_bd_pins lightstoleds_0/lightNS] [get_bd_pins top_diode_0/light] [get_bd_pins top_diode_2/light]
  connect_bd_net -net mux2_1_0_in_port [get_bd_pins kcpsm6_0/in_port] [get_bd_pins mux2_1_0/in_port]
  connect_bd_net -net pamiec_procesora_0_instruction [get_bd_pins kcpsm6_0/instruction] [get_bd_pins pamiec_procesora_0/instruction]
  connect_bd_net -net rst_1 [get_bd_ports rst] [get_bd_pins TrafficLights_0/rst] [get_bd_pins decoder_0/rst] [get_bd_pins kcpsm6_0/reset] [get_bd_pins mux2_1_0/rst]
  connect_bd_net -net top_7LED_0_anode [get_bd_ports anode1] [get_bd_pins top_7LED_0/anode]
  connect_bd_net -net top_7LED_0_cathode [get_bd_ports cathode0] [get_bd_pins top_7LED_0/cathode]
  connect_bd_net -net top_7LED_1_anode [get_bd_ports anode2] [get_bd_pins top_7LED_1/anode]
  connect_bd_net -net top_7LED_1_cathode [get_bd_ports cathode2] [get_bd_pins top_7LED_1/cathode]
  connect_bd_net -net top_7LED_2_anode [get_bd_ports anode0] [get_bd_pins top_7LED_2/anode]
  connect_bd_net -net top_7LED_2_cathode [get_bd_ports cathode1] [get_bd_pins top_7LED_2/cathode]
  connect_bd_net -net top_7LED_3_anode [get_bd_ports anode3] [get_bd_pins top_7LED_3/anode]
  connect_bd_net -net top_7LED_3_cathode [get_bd_ports cathode3] [get_bd_pins top_7LED_3/cathode]
  connect_bd_net -net top_diode_0_LEDs [get_bd_ports LEDs0] [get_bd_pins top_diode_0/LEDs]
  connect_bd_net -net top_diode_1_LEDs [get_bd_ports LEDs1] [get_bd_pins top_diode_1/LEDs]
  connect_bd_net -net top_diode_2_LEDs [get_bd_ports LEDs2] [get_bd_pins top_diode_2/LEDs]
  connect_bd_net -net top_diode_3_LEDs [get_bd_ports LEDs3] [get_bd_pins top_diode_3/LEDs]

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


