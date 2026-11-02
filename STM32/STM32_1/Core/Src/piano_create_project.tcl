# Vivado Tcl Console: source piano_create_project.tcl
set root [file dirname [file normalize [info script]]]
create_project piano [file normalize [file join $root .. .. build piano]] -part xc7s75fgga484-1 -force
add_files [list [file join $root piano.v] [file join $root piano_board.v]]
add_files -fileset sim_1 [list [file join $root tb_piano.sv]]
add_files -fileset constrs_1 [file join $root piano_piano_board.xdc]
set_property top piano_board [get_filesets sources_1]
set_property top tb_piano [get_filesets sim_1]
set_property xsim.simulate.runtime all [get_filesets sim_1]
update_compile_order -fileset sources_1
