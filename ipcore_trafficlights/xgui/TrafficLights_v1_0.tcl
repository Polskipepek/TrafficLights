# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "_counterWidth" -parent ${Page_0}
  ipgui::add_param $IPINST -name "_greenLightTimeWidth" -parent ${Page_0}
  ipgui::add_param $IPINST -name "_lightsWidth" -parent ${Page_0}
  ipgui::add_param $IPINST -name "_timeLeftWidth" -parent ${Page_0}


}

proc update_PARAM_VALUE._counterWidth { PARAM_VALUE._counterWidth } {
	# Procedure called to update _counterWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE._counterWidth { PARAM_VALUE._counterWidth } {
	# Procedure called to validate _counterWidth
	return true
}

proc update_PARAM_VALUE._greenLightTimeWidth { PARAM_VALUE._greenLightTimeWidth } {
	# Procedure called to update _greenLightTimeWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE._greenLightTimeWidth { PARAM_VALUE._greenLightTimeWidth } {
	# Procedure called to validate _greenLightTimeWidth
	return true
}

proc update_PARAM_VALUE._lightsWidth { PARAM_VALUE._lightsWidth } {
	# Procedure called to update _lightsWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE._lightsWidth { PARAM_VALUE._lightsWidth } {
	# Procedure called to validate _lightsWidth
	return true
}

proc update_PARAM_VALUE._timeLeftWidth { PARAM_VALUE._timeLeftWidth } {
	# Procedure called to update _timeLeftWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE._timeLeftWidth { PARAM_VALUE._timeLeftWidth } {
	# Procedure called to validate _timeLeftWidth
	return true
}


proc update_MODELPARAM_VALUE._lightsWidth { MODELPARAM_VALUE._lightsWidth PARAM_VALUE._lightsWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE._lightsWidth}] ${MODELPARAM_VALUE._lightsWidth}
}

proc update_MODELPARAM_VALUE._counterWidth { MODELPARAM_VALUE._counterWidth PARAM_VALUE._counterWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE._counterWidth}] ${MODELPARAM_VALUE._counterWidth}
}

proc update_MODELPARAM_VALUE._greenLightTimeWidth { MODELPARAM_VALUE._greenLightTimeWidth PARAM_VALUE._greenLightTimeWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE._greenLightTimeWidth}] ${MODELPARAM_VALUE._greenLightTimeWidth}
}

proc update_MODELPARAM_VALUE._timeLeftWidth { MODELPARAM_VALUE._timeLeftWidth PARAM_VALUE._timeLeftWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE._timeLeftWidth}] ${MODELPARAM_VALUE._timeLeftWidth}
}

