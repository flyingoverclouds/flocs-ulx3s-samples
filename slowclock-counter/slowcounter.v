module top(
        input clk_25mhz,
        output [7:0] led,
        output wifi_gpio0); 

    // keep esp32 board from rebooting (specific for ulx3s board)
    assign wifi_gpio0 = 1'b1;

    reg [7:0] o_led;
    assign led= o_led;


    //***************  sync the push button with slow clock and connect to led5
    
    wire newSlowClockSignal ; // wire to get the new slowclock signal
    
    slowclock sc(       // instance of a slowclock componen
        .clk(clk_25mhz) , // we feed the native 25mhz clock
        .clkslow(newSlowClockSignal)    // we get the slow cloc (~1.34hz)
    );

    assign o_led[7] = newSlowClockSignal; // led[7] will flash at the new slow clock speed

    reg[5:0] counter=0; // a counter
    assign o_led[5:0] = counter; // wiring counter bits on led0 to led5
    always @(posedge newSlowClockSignal) // each time slow clock tick
    begin
        counter <= counter + 1; // we increment counter
    end

    assign o_led[6] = 0; // force led6 to 0 (unused in this sample)
endmodule
