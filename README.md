# flocs-ulx3s-samples
My samples and tests on the FGPA ULX3S board and opensource toolchain for Lattice ECP5 fpga.

## Projects

### [Blinky](blinky/)
The blinky project demonstrate how to use access buttons to light on/off led, and how to use onboard clock to feed a counter to make led blinking
### [Push button counter](blinky-pushbuttons/)
The blinky-pushbuttons make led blinking with a counter incremented by pushing a button.
### [Debounced pushbutton counter](blinky-pushbuttons-debounced/)
the blinky-pushbutton-debounced project add a debouncer (implemented in a verilog module) to make 'push' button more reliable and avoiding double or triple inc on a single pression.

### [Slowclock counter](slowclock-counter/)
This project demonstrate how to generate a slower clock signal deriving from the main 25mhz clock and feedind a counter wired to led. 


### [LED PWM](led-pwm/)
This project demonstrate how to generate a PWM signal and use it to vary led light intensity
