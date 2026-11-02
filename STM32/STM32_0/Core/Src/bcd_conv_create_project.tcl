# Vivado Tcl Console: source bcd_conv_create_project.tcl
set root [file dirname [file normalize [info script]]]
create_project bcd_conv [file normalize [file join $root .. .. build bcd_conv]] -part xc7s75fgga484-1 -force
add_files [list [file join $root bcd_conv.v]]
add_files -fileset sim_1 [list [file join $root tb_bcd_conv.sv]]
add_files -fileset constrs_1 [file join $root bcd_conv_pins.xdc]
set_property top bcd_conv [get_filesets sources_1]
set_property top tb_bcd_conv [get_filesets sim_1]
set_property xsim.simulate.runtime all [get_filesets sim_1]
update_compile_order -fileset sources_1
