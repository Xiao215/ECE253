module part2(Clock, Reset_b, Data, Function, ALUout);
    input logic Clock, Reset_b;
    input logic [3:0] Data;
    input logic [2:0] Function;
    output logic [7:0] ALUout;
     logic [7:0] result;
     logic [3:0] B;
    always_comb
    begin
        case (Function)
            3'b000: result = Data + B;
            3'b001: result = Data * B;
            3'b010: result = B<<Data;
            default: result=result;
        endcase
    end
    always_ff @(posedge Clock)
    begin
        ALUout<= result;
        if (Reset_b) 
            B <= 4'b0000;
        else
            B<=ALUout[3:0];
    end
endmodule

// when do u do <= and when = and when assign? are they happening same time or in order?