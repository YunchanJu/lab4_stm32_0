# Vivado Tcl Console: source mult_4bit_simulate.tcl
set root [file dirname [file normalize [info script]]]
if {[llength [get_projects -quiet]]} { close_project }
source [file join $root mult_4bit_create_project.tcl]
launch_simulation
run all
close_sim
puts "Simulation finished: inspect the self-checking tb_mult_4bit PASS message."
