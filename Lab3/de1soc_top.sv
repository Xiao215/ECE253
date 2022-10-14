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

    hex_decoder h1(.c(SW[7:4]), .display(HEX1));//value of A
    hex_decoder h2(.c(SW[3:0]), .display(HEX0));//value of B

(a, b, c_in, s, c_out);
part1(.a(SW[7:4]), .b(SW[3:0]), , 0);
    hex_decoder h1(.c(SW[7:4]), .display(HEX1));//value of A
    hex_decoder h2(.c(SW[3:0]), .display(HEX0));//value of B
    hex_decoder h3(.c(LEDR[7:4]), .display(HEX4));//first 4 bits of LEDR
    hex_decoder h4(.c(LEDR[3:0]), .display(HEX3));//last 4 bit of LEDR
    hex_decoder h5(.c(KEY[3:0]), .display(HEX6));//last 4 bit of LEDR
    part2(.A(SW[7:4]), .B(SW[3:0]), .Function(KEY[1:0]), .ALUOut(LEDR[7:0]));

endmodule
