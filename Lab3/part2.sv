module part2(A, B, Function, ALUOut);
    input logic [3:0] A, B;
    input logic [1:0] Function;
    output logic [7:0] ALUOut;
    wire logic [7:0] w1, w2, w3, w4;
    concate c1(A, B, w4);
    adder a1(A, B, w1);
    bigOr(w1, w2);
    bigAnd(w1, w3);
    always_comb // declare always_comb block
        begin
            case (Function) // start case statement
            2'b00: ALUOut = w1; // Case 0
            2'b01: ALUOut = w2; // Case 1
            2'b10: ALUOut = w3; // Case 2
            2'b11: ALUOut = w4; // Case 3
            default:  ALUOut = 0; // Case 7
            endcase
        end
endmodule

module adder(a, b, c);
    input logic [3:0] a, b;
    output logic [7:0] c;
    wire [3:0] w1, w2;
    part1 add(a, b, 0, w1, w2);
    assign c = {w2[3], w1};
endmodule
module bigOr(a, c);
    input logic [7:0] a;
    output logic [7:0] c;
    assign c = |a;
endmodule
module bigAnd(a, c);
    input logic [7:0] a;
    output logic [7:0] c;
    assign c = &a;
endmodule
module concate(a, b, c);
    input logic [3:0] a, b;
    output logic [7:0] c;
    assign c = {a, b};
endmodule