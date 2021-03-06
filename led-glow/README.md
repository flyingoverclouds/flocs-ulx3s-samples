# LED Glow

This project reuse the PWM module used to vary intensity of a led
and change the PWM thresold using a counter

## Content

Each files contains comments describing behaviour & algorithm.

__led_glow.v__ : The main verilog file
    Glow onboard leds with inverted intensity (red / blue). 
    You can comment/uncomment led wiring to activiate police light effect : glow alternatively blue and red leds.

__pwm.v__ : the PWM module

__led_glow.ys__ : the Yosys command file
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
