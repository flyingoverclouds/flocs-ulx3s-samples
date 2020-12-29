module top(
        input clk_25mhz,
        output [7:0] led,
        output wifi_gpio0); 

    // keep esp32 board from rebooting (specific for ulx3s board)
    assign wifi_gpio0 = 1'b1;
   
    reg [32:0] cnt;
    always @(posedge clk_25mhz) 
    begin
        cnt <= cnt+1;
    end

    wire[3:0] pwmValue; // this wires will propagate the pwm value request

    assign pwmValue[3]= cnt[25] ? cnt[24] : ~cnt[24];
    assign pwmValue[2]= cnt[25] ? cnt[23] : ~cnt[23];
    assign pwmValue[1]= cnt[25] ? cnt[22] : ~cnt[22];
    assign pwmValue[0]= cnt[25] ? cnt[21] : ~cnt[21];

    // instantiate a PWM generator and connect it to a wire
    wire pwm2led;
    pwmGenerator pwm( 
        .clk(clk_25mhz), 
        .level(pwmValue), // get the PWM threshold from counter value
        .pwmSignal(pwm2led)
    );


    assign led[0]=~pwm2led; // glowing led inverted
    assign led[1]=~pwm2led; // glowing led inverted
    assign led[2]=pwm2led;  // glowing led
    assign led[3]=pwm2led;  // glowing led
    assign led[4]=~pwm2led; // glowing led inverted
    assign led[5]=~pwm2led;;// glowing led inverted
    assign led[6]=pwm2led;  // glowing led
    assign led[7]=pwm2led;  // glowing led


endmodule
