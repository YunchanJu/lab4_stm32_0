# Verified from existing Combo II-DLD S75 LAB1 DIP and LAB3 piezo projects.
set_property PACKAGE_PIN B6 [get_ports clk_50mhz]
set_property PACKAGE_PIN K4 [get_ports rst_p]
set_property PACKAGE_PIN Y21 [get_ports piezo]
set_property PACKAGE_PIN T1 [get_ports {key[0]}]
set_property PACKAGE_PIN U2 [get_ports {key[1]}]
set_property PACKAGE_PIN W3 [get_ports {key[2]}]
set_property PACKAGE_PIN Y1 [get_ports {key[3]}]
set_property PACKAGE_PIN U4 [get_ports {key[4]}]
set_property PACKAGE_PIN V4 [get_ports {key[5]}]
set_property PACKAGE_PIN W1 [get_ports {key[6]}]
set_property PACKAGE_PIN W4 [get_ports {key[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports *]
create_clock -name clk_50mhz -period 20.000 [get_ports clk_50mhz]
# Asynchronous switches/reset pass through two flip-flop synchronizers.
set_false_path -from [get_ports {key[*] rst_p}]
# Piezo is an unclocked external load; constrain register-to-pin path to one period.
set_output_delay -clock clk_50mhz 0.000 [get_ports piezo]
