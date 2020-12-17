@echo off
REM - yosys will generate the blinky.json file (netlist)
yosys blinky.ys

REM - nextpnr-ecp5 will execute the placement and routing (for ECP5-85 based board) (using the netlist and constraint file .lpf) stored in ulx3s_out.config
nextpnr-ecp5 --85k --json blinky_yosys.json --lpf ulx3s_v20.lpf --textcfg ulx3s85_out.config 

REM - ecppack will generate the binary BIT for the ECP5 fpga
ecppack ulx3s85_out.config ulx3s85k.bit
