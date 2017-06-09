# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  #Adding Group
  set Horizonal_Timing [ipgui::add_group $IPINST -name "Horizonal Timing" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "hActiveArea" -parent ${Horizonal_Timing}
  ipgui::add_param $IPINST -name "hFrontPorch" -parent ${Horizonal_Timing}
  ipgui::add_param $IPINST -name "hSyncPulse" -parent ${Horizonal_Timing}
  ipgui::add_param $IPINST -name "hBackPorch" -parent ${Horizonal_Timing}

  #Adding Group
  set Vertical_Timing [ipgui::add_group $IPINST -name "Vertical Timing" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "vActiveArea" -parent ${Vertical_Timing}
  ipgui::add_param $IPINST -name "vFrontPorch" -parent ${Vertical_Timing}
  ipgui::add_param $IPINST -name "vSyncPulse" -parent ${Vertical_Timing}
  ipgui::add_param $IPINST -name "vBackPorch" -parent ${Vertical_Timing}



}

proc update_PARAM_VALUE.hActiveArea { PARAM_VALUE.hActiveArea } {
	# Procedure called to update hActiveArea when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.hActiveArea { PARAM_VALUE.hActiveArea } {
	# Procedure called to validate hActiveArea
	return true
}

proc update_PARAM_VALUE.hBackPorch { PARAM_VALUE.hBackPorch } {
	# Procedure called to update hBackPorch when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.hBackPorch { PARAM_VALUE.hBackPorch } {
	# Procedure called to validate hBackPorch
	return true
}

proc update_PARAM_VALUE.hFrontPorch { PARAM_VALUE.hFrontPorch } {
	# Procedure called to update hFrontPorch when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.hFrontPorch { PARAM_VALUE.hFrontPorch } {
	# Procedure called to validate hFrontPorch
	return true
}

proc update_PARAM_VALUE.hSyncPulse { PARAM_VALUE.hSyncPulse } {
	# Procedure called to update hSyncPulse when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.hSyncPulse { PARAM_VALUE.hSyncPulse } {
	# Procedure called to validate hSyncPulse
	return true
}

proc update_PARAM_VALUE.vActiveArea { PARAM_VALUE.vActiveArea } {
	# Procedure called to update vActiveArea when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.vActiveArea { PARAM_VALUE.vActiveArea } {
	# Procedure called to validate vActiveArea
	return true
}

proc update_PARAM_VALUE.vBackPorch { PARAM_VALUE.vBackPorch } {
	# Procedure called to update vBackPorch when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.vBackPorch { PARAM_VALUE.vBackPorch } {
	# Procedure called to validate vBackPorch
	return true
}

proc update_PARAM_VALUE.vFrontPorch { PARAM_VALUE.vFrontPorch } {
	# Procedure called to update vFrontPorch when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.vFrontPorch { PARAM_VALUE.vFrontPorch } {
	# Procedure called to validate vFrontPorch
	return true
}

proc update_PARAM_VALUE.vSyncPulse { PARAM_VALUE.vSyncPulse } {
	# Procedure called to update vSyncPulse when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.vSyncPulse { PARAM_VALUE.vSyncPulse } {
	# Procedure called to validate vSyncPulse
	return true
}


proc update_MODELPARAM_VALUE.hActiveArea { MODELPARAM_VALUE.hActiveArea PARAM_VALUE.hActiveArea } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.hActiveArea}] ${MODELPARAM_VALUE.hActiveArea}
}

proc update_MODELPARAM_VALUE.hFrontPorch { MODELPARAM_VALUE.hFrontPorch PARAM_VALUE.hFrontPorch } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.hFrontPorch}] ${MODELPARAM_VALUE.hFrontPorch}
}

proc update_MODELPARAM_VALUE.hSyncPulse { MODELPARAM_VALUE.hSyncPulse PARAM_VALUE.hSyncPulse } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.hSyncPulse}] ${MODELPARAM_VALUE.hSyncPulse}
}

proc update_MODELPARAM_VALUE.hBackPorch { MODELPARAM_VALUE.hBackPorch PARAM_VALUE.hBackPorch } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.hBackPorch}] ${MODELPARAM_VALUE.hBackPorch}
}

proc update_MODELPARAM_VALUE.vActiveArea { MODELPARAM_VALUE.vActiveArea PARAM_VALUE.vActiveArea } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.vActiveArea}] ${MODELPARAM_VALUE.vActiveArea}
}

proc update_MODELPARAM_VALUE.vFrontPorch { MODELPARAM_VALUE.vFrontPorch PARAM_VALUE.vFrontPorch } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.vFrontPorch}] ${MODELPARAM_VALUE.vFrontPorch}
}

proc update_MODELPARAM_VALUE.vSyncPulse { MODELPARAM_VALUE.vSyncPulse PARAM_VALUE.vSyncPulse } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.vSyncPulse}] ${MODELPARAM_VALUE.vSyncPulse}
}

proc update_MODELPARAM_VALUE.vBackPorch { MODELPARAM_VALUE.vBackPorch PARAM_VALUE.vBackPorch } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.vBackPorch}] ${MODELPARAM_VALUE.vBackPorch}
}

