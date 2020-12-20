# BLINKY Debounced Counter

This project is based on the ulx3s quickstart , but extremly simplified (, no clock , no verilator code, no makefile)

## Content

__blinky_pushbutton_debounced.v__ : The main verilog file
The .v file contains enough to explain the 'algorithm'

* Push-Button based counter blink of 4 leds on the board
* Invert on/off the 2 other leds when pressing F1 button : _direct assignement of button pin to led pins (on with inverter)_

__debouncer.v__ : the basic debouncer code
This a reusable module than implement a basic debouncer. Simpliefied version of the [fpga4fun.com debouncer code](https://www.fpga4fun.com/Debouncer2.html).

__blinky_pushbutton_debounced.ys__ : the Yosys command file
Read and synthetise Verilog files onto blinky_pushbutton_debounced_yosys.json file

## Synthetizing & Testing

__synthetize_bit.cmd__ : command file to clean, resynthetize and generate bit file for EXP5 85k

__deploy_bit.cmd__ : deploy the bitfile in the ULX3S board using 'fujprog'

__clean.cmd__ : delete build artifact from current folder

### How to synthetize and test

__If you use a smaller ULX3s board__ (12f or 42f ECP5 variant), change the setting _BOARDVARIANT_ in _[synthetize_bit.cmd](synthetize_bit.cmd)_ and _[deploy_bit.cmd](deploy_bit.cmd)_

Synthetize the verilog file to generate binary bits :
```cmd
synthetize_bit.cmd
```

Deploy to ULX3S board :
```cmd
deploy_bit.cmd
```
