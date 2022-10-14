module de1soc_top 
(
    input logic CLOCK_50,
    output logic [6:0] HEX0,
    output logic [6:0] HEX1,
    output logic [6:0] HEX2,
    output logic [6:0] HEX3,
    output logic [6:0] HEX4,
    output logic [6:0] HEX5,

    input logic [3:0] KEY,
    output logic [9:0] LEDR,
    input logic [9:0] SW
);




    hex_decoder(.c(SW[7:4]), .display(HEX2));
    hex_decoder(.c(SW[3:0]), .display(HEX0));
    hex_decoder(.c(LEDR[7:4]), .display(HEX4));
    hex_decoder(.c(LEDR[3:0]), .display(HEX3));
    part2(.A(SW[7:4]), .B(SW[3:0]), .Function(KEY[1:0]), .ALUOut(LEDR[7:0]));

endmodule
