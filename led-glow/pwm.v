// this module produce a 16 level PWM signal.


module pwmGenerator(
    input clk,  // clk signal 
    input [3:0] level, // the tick count (of 256) where signal is up
    output reg pwmSignal, // the pwm signal
    );

    reg [3:0] counter=0; // pwm counter
    always @(posedge clk)
    begin
        if (counter[3:0]>level) // if counter > ratio -> output signal is DOWN
            pwmSignal=0;
        else    // else it is up
            pwmSignal=1;

        counter <= counter + 1;
    end
endmodule