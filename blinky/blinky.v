module top(input clk_25mhz,
           input [6:0] btn,
           output [7:0] led,
           output wifi_gpio0);

    // keep esp32 board from rebooting (specific for ulx3s board)
    assign wifi_gpio0 = 1'b1;

    wire i_clk;
    assign i_clk= clk_25mhz;

    reg [7:0] o_led;
    assign led= o_led;

    localparam ctr_width = 26;
    reg [ctr_width-1:0] ctr = 0;

    // direct wiring of F1 button to led6
    assign o_led[6] = btn[1];

    // direct wiring thru a not gate of F1 button to led6
    assign o_led[7] = !btn[1];
    
    // each time the clock signal change : inc counter, copy value to leds
    always @(posedge i_clk) begin
        ctr <= ctr + 1; // increment counter
        o_led[5:0] <= ctr[25:20]; // copy the 6 highest bit([20]->[25]) to output leds
    end

endmodule
