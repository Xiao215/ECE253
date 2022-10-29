module part3
#(parameter CLOCK_FREQUENCY=500)(
    input logic ClockIn,
    input logic Reset,
    input logic Start,
    input logic [2:0] Letter,
    output logic DotDashOut,
    output logic NewBitOut
);
    logic [11:0] mySequence;

    //pulse for every 0.5 seconds -- this is NewBitOut
    RateDivider u1(ClockIn, Reset, NewBitOUt);

    //shift register and counter to shift through the bits, 12 time
    //flipflop with the pulse as a clock that shifts through the letter -- output is our DotDashOut
    always_ff @(posedge NewBitOUt)
    

        
    

endmodule

module RateDivider
#(parameter CLOCK_FREQUENCY = 500) (
    input logic ClockIn,
    input logic Reset,
    output logic pulse
    );
    logic [$clog2(CLOCK_FREQUENCY):0] RateDividerCounter;
    assign pulse = (RateDividerCounter == CLOCK_FREQUENCY*0)?'1:'0;
    always_ff @(posedge ClockIn)
    begin
        if(Reset | pulse)
            RateDividerCounter <= (CLOCK_FREQUENCY/2)-1;
        else
            RateDividerCounter <= RateDividerCounter - 1;
    end
endmodule