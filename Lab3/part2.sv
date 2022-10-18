`include "part1.sv"

module part2(A, B, Function, ALUout);
    input logic [3:0] A, B;
    input logic [1:0] Function;
    output logic [7:0] ALUout;
    wire logic [7:0] w1, w2, w3, w4;
    concate c1(A, B, w4);
    adder a1(A, B, w1);
    bigOr bo(.a(w4), .c(w2));
    bigAnd ba(w4, w3);
    always_comb // declare always_comb block
    begin
        case (Function) // start case statement
        2'b00: ALUout = w1; // Case 0
        2'b01: ALUout = w2; // Case 1
        2'b10: ALUout = w3; // Case 2
        2'b11: ALUout = w4; // Case 3
        default:  ALUout = 8'b00000000; // Case 7
        endcase
    end
endmodule

module adder(a, b, c);
    input logic [3:0] a, b;
    output logic [7:0] c;
    wire [3:0] w5, w6;
    part1 addNum(a, b, 1'b0, w5, w6);
    assign c = {w6[3], w5};
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
