##============================================================
## Clock
##============================================================
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.000 -waveform {0 5} [get_ports clk]

##============================================================
## Reset Button (BTN0)
##============================================================
set_property PACKAGE_PIN U18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

##============================================================
## Comparator Output (ena)
## External Comparator -> FPGA
## JA1
##============================================================
set_property PACKAGE_PIN J1 [get_ports ena]
set_property IOSTANDARD LVCMOS33 [get_ports ena]

##============================================================
## DAC Digital Inputs (8-bit)
## FPGA -> External DAC
##============================================================

## JA2
set_property PACKAGE_PIN L2 [get_ports {out[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[7]}]

## JA3
set_property PACKAGE_PIN J2 [get_ports {out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[6]}]

## JA4
set_property PACKAGE_PIN G2 [get_ports {out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[5]}]

## JA7
set_property PACKAGE_PIN H1 [get_ports {out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[4]}]

## JA8
set_property PACKAGE_PIN K2 [get_ports {out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[3]}]

## JA9
set_property PACKAGE_PIN H2 [get_ports {out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[2]}]

## JA10
set_property PACKAGE_PIN G3 [get_ports {out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[1]}]

## JB1
set_property PACKAGE_PIN A14 [get_ports {out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[0]}]

##============================================================
## Conversion Done LED
##============================================================
set_property PACKAGE_PIN U16 [get_ports conversion_done]
set_property IOSTANDARD LVCMOS33 [get_ports conversion_done]
