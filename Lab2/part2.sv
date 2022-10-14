module mux2to1(x, y, s, m);
    input logic x; //select 0
    input logic y; //select 1
    input logic s; //select signal
    output logic m; //output
  logic connection1, connection2, connection3;
  v7404 n1(.pin1(s), .pin2(connection1));
  v7408 a1(.pin1(connection1), .pin2(x), .pin3(connection2));
  v7408 a2(.pin4(s), .pin5(y), .pin6(connection3));
  v7432 o1(.pin1(connection2), .pin2(connection3), .pin3(m));


endmodule

module v7408(pin1, pin2, pin3, pin4, pin5, pin6, pin8, pin9, pin10, pin11, pin12, pin13);
    input logic pin1, pin2, pin4, pin5, pin13, pin12, pin9, pin10;
    output logic pin3, pin6, pin11, pin8; //output
    assign pin3 = pin1&pin2;
    assign pin6 = pin4&pin5;
    assign pin8 = pin10&pin9;
    assign pin11 = pin13&pin12;
endmodule

module v7432(pin1, pin2, pin3, pin4, pin5, pin6, pin8, pin9, pin10, pin11, pin12, pin13);
    input logic pin1, pin2, pin4, pin5, pin13, pin12, pin9, pin10;
    output logic pin3, pin6, pin11, pin8; //output
    assign pin3 = pin1|pin2;
    assign pin6 = pin4|pin5;
    assign pin8 = pin10|pin9;
    assign pin11 = pin13|pin12;
endmodule

module v7404 (pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8, pin10, pin12);
    input logic pin1, pin3, pin5, pin9, pin11, pin13;
    output logic pin2, pin4, pin6, pin8, pin10, pin12;
    
    assign pin2 = ~pin1;
    assign pin4 = ~pin3;
    assign pin6 = ~pin5;
    assign pin8 = ~pin9;
    assign pin10 = ~pin11;
    assign pin12 = ~pin13;

endmodule