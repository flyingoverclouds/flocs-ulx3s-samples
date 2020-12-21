module top(
        input clk_25mhz,
        input [6:0] btn,
        output [7:0] led,
        output wifi_gpio0); 

    // keep esp32 board from rebooting (specific for ulx3s board)
    assign wifi_gpio0 = 1'b1;
    
    // reg [7:0] o_led=0;
    // assign led= o_led;

    //**************** debounce button UP
    wire debouncedUP;     
    debouncer dUP(      
        .clk(clk_25mhz),                
        .inputSignal(btn[3]) ,          
         .debouncedSignal(debouncedUP)    
    ); 
    
    //**************** debounce button DOWN
    wire debouncedDOWN;     
    debouncer dDOWN(      
        .clk(clk_25mhz),                
        .inputSignal(btn[4]) ,          
         .debouncedSignal(debouncedDOWN)    
    ); 
    

    reg [7:0] pwmLevelCounter = 0;  // the 7bits (256 value) of desired pwmLevel
    //each time a button up or down is pressed 
    always @(posedge(debouncedUP | debouncedDOWN) ) 
    begin
        if(debouncedUP==1)
            pwmLevelCounter <= pwmLevelCounter + 1; // increment counter
        else 
            pwmLevelCounter <= pwmLevelCounter - 1; // decrement counter
        
    end

    assign led = pwmLevelCounter; // for debug : display counter on led

  

endmodule
