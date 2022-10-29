module part2
#(parameter CLOCK_FREQUENCY = 500)(
    input logic ClockIn,
    input logic Reset,
    input logic [1:0] Speed,
    output logic [3:0] CounterValue
    );
    wire logic pulse;
    RateDivider u1(ClockIn, Reset, Speed, pulse);
    DisplayCounter u2(ClockIn, Reset, pulse, CounterValue);
endmodule

module RateDivider
#(parameter CLOCK_FREQUENCY = 500) (
    input logic ClockIn,
    input logic Reset,
    input logic [1:0] Speed,
    output logic pulse
    );
    logic [$clog2(CLOCK_FREQUENCY) + 2 :0] RateDividerCounter;
    // logic new_frequency[$clog2(CLOCK_FREQUENCY) + 2 :0]; //worst case will be * 4, so plus 2 bits
    assign pulse = (RateDividerCounter == CLOCK_FREQUENCY*0)?'1:'0;
    always_ff @(posedge ClockIn)
    begin
        if(Reset | pulse)
            case (Speed)
                2'b00: RateDividerCounter <= CLOCK_FREQUENCY*0;
                2'b01: RateDividerCounter <= CLOCK_FREQUENCY - 1;
                2'b10: RateDividerCounter <= (CLOCK_FREQUENCY * 2) - 1;
                2'b11: RateDividerCounter <= (CLOCK_FREQUENCY * 4) - 1;
                default: RateDividerCounter <= CLOCK_FREQUENCY*0;
            endcase
        else
            RateDividerCounter <= RateDividerCounter - 1;
    end
endmodule

module DisplayCounter (
    input logic Clock,
    input logic Reset,
    input logic EnableDC,
    output logic [3:0] CounterValue
    );
    always_ff@(posedge Clock) begin
        if (Reset) 
        begin
            CounterValue <= 0;
        end
        else 
        begin
            CounterValue <= CounterValue + EnableDC;
        end
    end
endmodule