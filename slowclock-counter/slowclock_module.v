// this module implement a basic slow clock deriving from the main clock

module slowclock(
    input clk,  // clk signal 
    output clkslow, // output slow clock signal
    );

    //**************** slow clock generation ( ~1.34hz for a based 25mhz clock)

    reg [24:0] clockCounter = 0;    // the clock counter to generate a slower clock (). the highest bit will be assignt to the slow clock signal
    assign clkslow = clockCounter[24];     // a clock signal shoul be half time up / half time down -> We use the higher bit of counter to generate output clock signal

    always @(posedge clk)     // each clock tick
    begin
        clockCounter <= clockCounter+1;     // increment the counter
    end
    wire slowclk; // the slow clock signal wire

endmodule