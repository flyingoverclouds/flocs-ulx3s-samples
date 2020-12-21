// this module produce a 256 level PWM signal.


module pwmGenerator(
    input clk,  // clk signal 
    input [7:0] level, // the tick count (of 256) where signal is up
    output pwmSignal, // the pwm signal
    );
    reg [7:0] counter=0; // pwm counter
    always @(posedge clk)
    begin
        if (counter>ratioUp) // if counter > ratio -> output signal is DOWN
            pwmSignal<=0;
        else    // else it is up
            pwmSignal<=1;
        counter <= counter + 1;
    end
endmodule