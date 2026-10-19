# Run in Vivado Tcl Console: source <folder>/create_project.tcl
set root [file dirname [file normalize [info script]]]
create_project bcd_conv [file join $root vivado_recreated] -part xc7s75fgga484-1 -force
add_files [glob [file join $root src *.v]]
add_files -fileset sim_1 [glob [file join $root sim *.sv]]
add_files -fileset constrs_1 [file join $root constraints pins.xdc]
set_property top bcd_conv [get_filesets sources_1]
set_property top tb_bcd_conv [get_filesets sim_1]
set_property xsim.simulate.runtime all [get_filesets sim_1]
update_compile_order -fileset sources_1
