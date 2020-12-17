module top(input [6:0] btn,
           output [7:0] led,
           output wifi_gpio0); 

    // keep esp32 board from rebooting (specific for ulx3s board)
    assign wifi_gpio0 = 1'b1;

    reg [7:0] o_led;
    assign led= o_led;

    // direct wiring of F1 button to led6
    assign o_led[6] = btn[1];

    // direct wiring thru a not gate of F1 button to led6
    assign o_led[7] = !btn[1];


    reg [5:0] counter = 0; // the counter
    // each time the button F0 signal change : inc counter, copy value to leds
    always @(posedge btn[2]) begin
        counter <= counter + 1; // increment counter
        o_led[5:0] <= counter[5:0]; // copy the 6  bits  to output leds
    end

endmodule
