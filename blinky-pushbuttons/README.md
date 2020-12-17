# BLINKY counter

This project is based on the ulx3s quickstart , but extremly simplified (, no clock , no verilator code, no makefile)

__blinky_pushbutton.v__ : The main verilog file 
The .v file contains enough to explain the 'algorithm'

* push button based blinking of 6 leds on the board : _6 highest bits of a 26bits counter incremented each time F2 button is pressed_
* Invert on/off the 2 other leds when pressing F1 button : _direct assignement of button pin to led pins (on with inverter)_

__blinky_pushbutton.ys__ : the Yosys command file
Read and synthetise blinky.v onto blinky_yosys.json file

__synthetize_bit.cmd__ : command file to clean, resynthetize and generate bit file for EXP5 85k

__deploy_bit.cmd__ : deplou the bitfile in the ULX3S board using 'fujprog'

## Usage

__If you use a smaller ULX3s board__ (12f or 42f ECP5 variant), change the setting _BOARDVARIANT_ in _[synthetize_bit.cmd](synthetize_bit.cmd)_ and _[deploy_bit.cmd](deploy_bit.cmd)_

Synthetize the verilog file to generate binary bits :
```cmd
synthetize_bit.cmd
```


Deploy to ULX3S board :
```cmd
deploy_bit.cmd
```
