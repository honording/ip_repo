# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "hbp" -parent ${Page_0}
  ipgui::add_param $IPINST -name "hfp" -parent ${Page_0}
  ipgui::add_param $IPINST -name "hpixels" -parent ${Page_0}
  ipgui::add_param $IPINST -name "hpulse" -parent ${Page_0}
  ipgui::add_param $IPINST -name "vbp" -parent ${Page_0}
  ipgui::add_param $IPINST -name "vfp" -parent ${Page_0}
  ipgui::add_param $IPINST -name "vlines" -parent ${Page_0}
  ipgui::add_param $IPINST -name "vpulse" -parent ${Page_0}


}

proc update_PARAM_VALUE.hbp { PARAM_VALUE.hbp } {
	# Procedure called to update hbp when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.hbp { PARAM_VALUE.hbp } {
	# Procedure called to validate hbp
	return true
}

proc update_PARAM_VALUE.hfp { PARAM_VALUE.hfp } {
	# Procedure called to update hfp when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.hfp { PARAM_VALUE.hfp } {
	# Procedure called to validate hfp
	return true
}

proc update_PARAM_VALUE.hpixels { PARAM_VALUE.hpixels } {
	# Procedure called to update hpixels when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.hpixels { PARAM_VALUE.hpixels } {
	# Procedure called to validate hpixels
	return true
}

proc update_PARAM_VALUE.hpulse { PARAM_VALUE.hpulse } {
	# Procedure called to update hpulse when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.hpulse { PARAM_VALUE.hpulse } {
	# Procedure called to validate hpulse
	return true
}

proc update_PARAM_VALUE.vbp { PARAM_VALUE.vbp } {
	# Procedure called to update vbp when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.vbp { PARAM_VALUE.vbp } {
	# Procedure called to validate vbp
	return true
}

proc update_PARAM_VALUE.vfp { PARAM_VALUE.vfp } {
	# Procedure called to update vfp when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.vfp { PARAM_VALUE.vfp } {
	# Procedure called to validate vfp
	return true
}

proc update_PARAM_VALUE.vlines { PARAM_VALUE.vlines } {
	# Procedure called to update vlines when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.vlines { PARAM_VALUE.vlines } {
	# Procedure called to validate vlines
	return true
}

proc update_PARAM_VALUE.vpulse { PARAM_VALUE.vpulse } {
	# Procedure called to update vpulse when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.vpulse { PARAM_VALUE.vpulse } {
	# Procedure called to validate vpulse
	return true
}


proc update_MODELPARAM_VALUE.hpixels { MODELPARAM_VALUE.hpixels PARAM_VALUE.hpixels } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.hpixels}] ${MODELPARAM_VALUE.hpixels}
}

proc update_MODELPARAM_VALUE.vlines { MODELPARAM_VALUE.vlines PARAM_VALUE.vlines } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.vlines}] ${MODELPARAM_VALUE.vlines}
}

proc update_MODELPARAM_VALUE.hpulse { MODELPARAM_VALUE.hpulse PARAM_VALUE.hpulse } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.hpulse}] ${MODELPARAM_VALUE.hpulse}
}

proc update_MODELPARAM_VALUE.vpulse { MODELPARAM_VALUE.vpulse PARAM_VALUE.vpulse } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.vpulse}] ${MODELPARAM_VALUE.vpulse}
}

proc update_MODELPARAM_VALUE.hbp { MODELPARAM_VALUE.hbp PARAM_VALUE.hbp } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.hbp}] ${MODELPARAM_VALUE.hbp}
}

proc update_MODELPARAM_VALUE.hfp { MODELPARAM_VALUE.hfp PARAM_VALUE.hfp } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.hfp}] ${MODELPARAM_VALUE.hfp}
}

proc update_MODELPARAM_VALUE.vbp { MODELPARAM_VALUE.vbp PARAM_VALUE.vbp } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.vbp}] ${MODELPARAM_VALUE.vbp}
}

proc update_MODELPARAM_VALUE.vfp { MODELPARAM_VALUE.vfp PARAM_VALUE.vfp } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.vfp}] ${MODELPARAM_VALUE.vfp}
}

