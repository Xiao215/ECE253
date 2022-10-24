module part2(Clock, Reset_b, Data, Function, ALUout);
    input logic Clock, Reset_b;
    input logic [3:0] Data;
    input logic [2:0] Function;
    output logic [7:0] ALUout;
    logic [7:0] result;
    logic [3:0] B;
    assign B= ALUout[3:0];
    always_comb
    begin
        case (Function)
            3'b000: result = Data + B;
            3'b001: result = Data * B;
            3'b010: result = B<<Data;
            3'b011: result=result;
            default: result=8'b00000000;
        endcase
    end
    always_ff @(posedge Clock)
    begin
        if (Reset_b) 
            ALUout <= 8'b00000000;
        else
            ALUout <= result;
    end
endmodule

// when do u do <= and when = and when assign? are they happening same time or in order?
    // logic [3:0] B=ALUout[3:0];
    // assign B= ALUout[3:0];
    //difference?
