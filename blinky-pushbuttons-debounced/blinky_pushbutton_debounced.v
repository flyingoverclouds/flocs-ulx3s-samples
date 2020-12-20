module top(
        input clk_25mhz,
        input [6:0] btn,
        output [7:0] led,
        output wifi_gpio0); 

    // keep esp32 board from rebooting (specific for ulx3s board)
    assign wifi_gpio0 = 1'b1;
    
    reg [7:0] o_led;
    assign led= o_led;

    //************** direct assignement of button to led for basic test
    // direct wiring of F1 button to led6
    assign o_led[6] = btn[1];
    // direct wiring thru a not gate of F1 button to led6
    assign o_led[7] = !btn[1];

    assign o_led[4]=0; // led 4 is off
    assign o_led[5]=0; // led 5 is off

    //**************** Manual counter with push button
    wire debounced;     // wire used to connect output of debouncer
    debouncer dF0(      // instantiate a debouncer componant and wire its input/output 
        .clk(clk_25mhz),                // clock signal is the main clock (25mhz)
        .inputSignal(btn[2]) ,          // signal to debounced if button 'Fire 2' (aka btn[2])
         .debouncedSignal(debounced)    // the debouncer signal to connected to 'debounced' wire
    ); 
    
    reg [3:0] pushCounter = 0;  // the push 4bits counter
    
    //each time the debounced F2 signal change : inc counter and update leds status
    always @(posedge debounced) begin
        pushCounter <= pushCounter + 1; // increment counter
        o_led[3:0] <= pushCounter;      // copy the counter bits to output leds 0->3
    end

endmodule
