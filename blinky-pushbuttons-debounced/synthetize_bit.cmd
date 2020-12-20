@echo off

REM - if needed, replace this seeting with you ULX3S board variant (12k,25k or 45k instead of 85k)
SET BOARDVARIANT=85k

REM - cleaning previous output files
DEL blinky_pushbutton_debounced_yosys.json blinky_pushbutton_debounced_ulx3s%BOARDVARIANT%_out.config blinky_pushbutton_debounced_ulx3s%BOARDVARIANT%.bit abc.history

REM - yosys will generate the blinky.json file (netlist)
yosys blinky_pushbutton_debounced.ys

REM - nextpnr-ecp5 will execute the placement and routing (for ECP5 based board) (using the netlist and constraint file .lpf) stored in _out.config
nextpnr-ecp5 --%BOARDVARIANT% --json blinky_pushbutton_debounced_yosys.json --lpf ulx3s_v20.lpf --textcfg blinky_pushbutton_debounced_ulx3s%BOARDVARIANT%_out.config 

REM - ecppack will generate the binary BIT for the ECP5 fpga
ecppack blinky_pushbutton_debounced_ulx3s%BOARDVARIANT%_out.config blinky_pushbutton_debounced_ulx3s%BOARDVARIANT%.bit
