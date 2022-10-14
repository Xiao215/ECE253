module part1(a, b, c_in, s, c_out);
    input logic [3:0] a, b;
    input logic c_in;
    output logic [3:0] s, c_out;
    FA fa1(.a(a[0]), .b(b[0]), .c_in(c_in), .s(s[0]), .c_out(c_out[0]));
    FA fa2(.a(a[1]), .b(b[1]), .c_in(c_out[0]), .s(s[1]), .c_out(c_out[1]));
    FA fa3(.a(a[2]), .b(b[2]), .c_in(c_out[1]), .s(s[2]), .c_out(c_out[2]));
    FA fa4(.a(a[3]), .b(b[3]), .c_in(c_out[2]), .s(s[3]), .c_out(c_out[3]));
endmodule
module FA(a, b, c_in, s, c_out);
    input logic a, b, c_in;
    output logic s, c_out;

    assign s = a ^ b ^ c_in;
    assign c_out = a&b | b&c_in | c_in&a;
endmodule 