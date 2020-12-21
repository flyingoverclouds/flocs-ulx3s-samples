# LED Pwm

This project define a PWM module used to vary intensity of a led.
Button Up increase the intensity, Down reduced the intensity.

## Content

Each files contains comments describing behaviour & algorithm.

__led_pwm.v__ : The main verilog file

__pwm.v__ : the PWM module

__debouncer.v__ : the basic debouncer code
USed to debounce push button

__led_pwm.ys__ : the Yosys command file
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
