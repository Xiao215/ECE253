`include "part1.sv"

module part3(A, B, Function, ALUout);
    parameter N = 4;
    input logic [N-1:0] A, B;
    input logic [1:0] Function;
    output logic [2*N-1:0] ALUout;
    always_comb // declare always_comb block
    begin
        case (Function) // start case statement
        2'b00: ALUout = A+B; // Case 0
        2'b01: ALUout = |A; // Case 1
        2'b10: ALUout = &A; // Case 2
        2'b11: ALUout = {A, B}; // Case 3
        default:  ALUout = 8'b00000000; // Case 7
        endcase
    end
endmodule
