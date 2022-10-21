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
    part2(.Data(SW[3:0]), .Function(KEY[3:0]) .ALUOut(LEDR[7:0]));
    hex_decoder h1(.c(SW[3:0]), .display(HEX1));//value of input
    hex_decoder h1(.c(KEY[3:0]), .display(HEX3));//value of input
    hex_decoder h5(.c(LEDR[3:0]), .display(HEX5));//last 4 bit of LEDR
    hex_decoder h6(.c(LEDR[7:4]), .display(HEX6));//first 4 bit of LEDR

endmodule
