# Vivado Tcl Console: source adc_create_project.tcl
set root [file dirname [file normalize [info script]]]
create_project adc [file normalize [file join $root .. .. build adc]] -part xc7s75fgga484-1 -force
add_files [list [file join $root adc.v]]
add_files -fileset sim_1 [list [file join $root tb_adc.sv]]
add_files -fileset constrs_1 [file join $root adc_clock_only.xdc]
set_property top adc [get_filesets sources_1]
set_property top tb_adc [get_filesets sim_1]
set_property xsim.simulate.runtime all [get_filesets sim_1]
update_compile_order -fileset sources_1
