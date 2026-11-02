# Vivado Tcl Console: source mult_4bit_create_project.tcl
set root [file dirname [file normalize [info script]]]
create_project mult_4bit [file normalize [file join $root .. .. build mult_4bit]] -part xc7s75fgga484-1 -force
add_files [list [file join $root mult_4bit.v]]
add_files -fileset sim_1 [list [file join $root tb_mult_4bit.sv]]
add_files -fileset constrs_1 [file join $root mult_4bit_pins.xdc]
set_property top mult_4bit [get_filesets sources_1]
set_property top tb_mult_4bit [get_filesets sim_1]
set_property xsim.simulate.runtime all [get_filesets sim_1]
update_compile_order -fileset sources_1
