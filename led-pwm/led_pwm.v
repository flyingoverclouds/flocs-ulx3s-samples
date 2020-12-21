module top(
        input clk_25mhz,
        input [6:0] btn,
        output [7:0] led,
        output wifi_gpio0); 

    // keep esp32 board from rebooting (specific for ulx3s board)
    assign wifi_gpio0 = 1'b1;
    
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
    
    always @(posedge(debouncedUP | debouncedDOWN) ) //each time a button up or down is pressed 
    begin
        if(debouncedUP==1)
            pwmLevelCounter <= pwmLevelCounter + 16; // increment counter
        else 
            pwmLevelCounter <= pwmLevelCounter - 16; // decrement counter
    end

    pwmGenerator pwm( 
        .clk(clk_25mhz),
        .level(pwmLevelCounter),
        .pwmSignal(pwmLevel)
    );
    wire pwmLed;

    assign led[0] = pwmLevel;
    assign led[1] = pwmLevel;
    assign led[2] = pwmLevel;
    assign led[3] = pwmLevel;
    assign led[4] = pwmLevel;
    assign led[5] = pwmLevel;
    assign led[6] = pwmLevel;
    assign led[7] = pwmLevel;


endmodule
