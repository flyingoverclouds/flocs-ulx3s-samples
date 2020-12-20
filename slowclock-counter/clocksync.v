// this module sync the  output signal with the clock signal.

module clocksync(
    input clk,  // clk signal 
    input unsyncSignal, // original unsync signal
    output reg syncSignal, // output clock synced signal
    );

    // clock syncing ofthe input signal
    reg s0;
    always@(posedge clk) s0 <= unsyncSignal;
    
    reg s1;
    always@(posedge clk) s1 <= s0;

    assign syncSignal = s1;

endmodule