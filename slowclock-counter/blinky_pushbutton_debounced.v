module top(
        input clk_25mhz,
        input [6:0] btn,
        output [7:0] led,
        output wifi_gpio0); 

    // keep esp32 board from rebooting (specific for ulx3s board)
    assign wifi_gpio0 = 1'b1;
    
    reg [7:0] o_led;
    assign led= o_led;

    //************** direct assignement of button to led for test
    // direct wiring of F1 button to led6
    assign o_led[6] = btn[1];

    // direct wiring thru a not gate of F1 button to led6
    assign o_led[7] = !btn[1];


    //**************** manual counter with debounced button
    wire debounced;
    debouncer dF0( .clk(clk_25mhz), .inputSignal(btn[2]) , .debouncedSignal(debounced) );
    //debouncer dF0( .clk(slowclk), .inputSignal(btn[2]) , .debouncedSignal(debounced) );
    
    reg [3:0] pushCounter = 0; // the push counter
    //each time the debounced F0 signal change : inc counter, copy value to leds
    //always @(posedge btn[2]) begin
    always @(posedge debounced) begin
        pushCounter <= pushCounter + 1; // increment counter
        o_led[3:0] <= pushCounter[3:0]; // copy the 6  bits  to output leds
    end


    //**************** slow clock generation ( ~1.34hz for a based 25mhz clock)
    reg [24:0] clockCounter = 0;    // the clock counter to generate a slower clock ()
    always @(posedge clk_25mhz)     // each clock tick
    begin
        clockCounter <= clockCounter+1;     // increment the counter
        o_led[4] <= clockCounter[24];
        slowclk <= clockCounter[24];
    end
    wire slowclk; // the slow clock signal wire


    //***************  sync the push button with slow clock and connect to led5
    clocksync syncerF2( 
        .clk(slowclk),
        .unsyncSignal(btn[1]),
        .syncSignal(buttonPushSynced)
        );
    wire buttonPushSynced;
    assign o_led[5] = buttonPushSynced;

endmodule
