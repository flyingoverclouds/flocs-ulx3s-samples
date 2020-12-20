// this debouncer product a clock-synched signal when button is pressed. 
// The ouput signals is as long  as the pressure lasts + state change flassh, with bounce glitched removed, andsync whith clock

module debouncer(
    input clk,  // clk signal 
    input inputSignal, // original unsync signal
    output reg debouncedSignal, // output clock synced &debounced signal
    );

    // clock syncing ofthe input signal
    reg s0;
    always@(posedge clk) s0 <= ~inputSignal;
    
    reg s1;
    always@(posedge clk) s1 <= s0;


    reg [15:0] counter; // debounce timer counter
    
    wire idle = (debouncedSignal == s1);
    
    wire countFinished = &counter; // 1 if all bit of counter are 1

    always @(posedge clk)
    begin
        if (idle)
            counter<=0;
        else
        begin
            counter <= counter + 1;
            if (countFinished) debouncedSignal<= ~debouncedSignal;
        end

    end


    // always @(posedge clk)
    //     if(pushbut_idle)
    //     begin
    //         counter <= 0;  // nothing to do, set counter to 0
    //     end
    //     else
    //     begin
    //         counter <= counter + 1;  
    //         if(finished)
    //         begin
    //             debounced <= ~debounced;  
    //         end
    //     end

    // assign debounced_down = ~pushbut_idle & finished & ~debounced;
    // assign debounced_up   = ~pushbut_idle & finished &  debounced;


//     assign debounced = pushbutton;
//     assign debounced_down = pushbutton;
//     assign debounced_up = pushbutton;
endmodule