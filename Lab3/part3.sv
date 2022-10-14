module partN-1(A, B, Function, ALUOut);
    parameter N = 4;
    input logic [N:0] A, B;
    input logic [1:0] Function;
    output logic [2*N-1:0] ALUOut;
    wire logic [2*N-1:0] w2, w3, w4;
    concate c1(A, B, w4);
    bigOr(w1, w2);
    bigAnd(w1, w3);
    always_comb // declare always_comb block
        begin
            case (Function) // start case statement
            2'b00: ALUOut = A+B; // Case 0
            2'b01: ALUOut = w2; // Case 1
            2'b10: ALUOut = w3; // Case 2
            2'b11: ALUOut = w4; // Case 3
            default:  ALUOut = 0; // Case ???
            endcase
        end
endmodule

module bigOr(a, c);
    input logic [2*N-1:0] a;
    output logic [2*N-1:0] c;
    assign c = |a;
endmodule
module bigAnd(a, c);
    input logic [2*N-1:0] a;
    output logic [2*N-1:0] c;
    assign c = &a;
endmodule
module concate(a, b, c);
    input logic [N-1:0] a, b;
    output logic [2*N-1:0] c;
    assign c = {a, b};
endmodule