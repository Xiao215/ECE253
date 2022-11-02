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

    //encoder to get the letter
    always_comb
    begin
        case (Letter)
            3'b000: mySequence <= 12'b101110000000; //A
            3'b001: mySequence <= 12'b111010101000; //B
            3'b010: mySequence <= 12'b111010111010; //C
            3'b011: mySequence <= 12'b111010100000; //D
            3'b100: mySequence <= 12'b100000000000; //E
            3'b101: mySequence <= 12'b101011101000; //F
            3'b110: mySequence <= 12'b111011101000; //G
            3'b111: mySequence <= 12'b101010100000; //H
            default: mySequence <= 12'b111111111111; //default
        endcase
    end

    //pulse for every 0.5 s, this is NewBitOUt
    RateDivider u1(ClockIn, Reset, Start, NewBitOut);

    //push a new bit out on each NewBitOut, we will start counting if there is Start
    logic [3:0] bitcount; //count which bit we are on, will start at 11 and go to 0 when Start
    //note: bitcount will go to -1 after the lst letter, this si our flag for no more letter (dotdash is jsut 0 when bitcount -1)
    DisplayCounter_Start u2(ClockIn, Reset, NewBitOut, Start, bitcount);
    //flipflop with the pulse as a clock that shifts through the letter -- output is our DotDashOut
    always_comb
    begin
        begin
            if (bitcount == 0) //flag meaning no letter to output
            begin
                DotDashOut = 0; //equiv of done, don't print anything
            end
            else //if it is a positive number i.e. start has been selected and the counter has been printing down
            begin
                DotDashOut = mySequence[bitcount-1];
                //note: bitcount should automatically update every NewBitOut by construction in the DisplayCounter_Start module
            end
        end
    end

    //check: does the start lag work?? is the indexing correct??
endmodule


module RateDivider
#(parameter CLOCK_FREQUENCY = 500) (
    input logic ClockIn,
    input logic Reset,
    input logic Start,
    output logic pulse
    );
    logic [$clog2(CLOCK_FREQUENCY):0] RateDividerCounter;
    assign pulse = RateDividerCounter == CLOCK_FREQUENCY*0;
    // always_ff @(posedge pulse)
    // begin
    //     $display("we return pulse when counter is %d", RateDividerCounter);
    // end
    // always_ff @(negedge pulse)
    // begin
    //     $display("we stop return pulse when counter is %d", RateDividerCounter);
    // end
    // int count = 0;
    always_ff @(posedge ClockIn)
    begin            
        // count++;
        // if(count <= 300)
        //     $display("pulse is %d, counter is %d, reset is %d", pulse, RateDividerCounter, Reset);
        if(Reset | Start | pulse)
        begin
            RateDividerCounter <= (CLOCK_FREQUENCY/2)-1;
        end
        else
            RateDividerCounter <= RateDividerCounter - 1;
    end
endmodule



module DisplayCounter_Start (
    input logic Clock,
    input logic Reset,
    input logic EnableDC,
    input logic Start,
    output logic [3:0] CounterValue
    );
    always_ff@(posedge Clock) begin
        if (Reset | CounterValue == -1) //don't print anymore
        begin
            CounterValue <= -1;
        end
        else if (Start) //reset indexing
        begin
            CounterValue <= 4'b1100;
        end
        else if (~Reset) //count down (until -1, see first if)
        begin
            CounterValue <= CounterValue - EnableDC;
        end
    end
endmodule