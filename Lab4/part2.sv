module part2(Clock, Reset b, Data, Function, ALUout);
    input logic Clock, Reset;
    input logic [3:0] Data;
    input logic [3:0] Function;
    output logic [7:0] ALUout;
    wire logic [3:0] B;
    always_comb
    begin
        case (Function)
            4'b0000: ALUout = Data + B;
            4'b0001: ALUout = Data * B;
            4'b0010: ALUout = B<<Data;
            default: ALUout=ALUout;
        endcase
    end
    always_ff @(posedge Clock)
    begin
        if (reset_b) 
            B <= 4’b0000;
        else
            B<=ALUOut[3:0];
    end
endmodule