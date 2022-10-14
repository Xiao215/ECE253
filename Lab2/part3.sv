module hex_decoder(c, display);
    input logic [0:3]c;
    output logic [6:0] display;
    assign display[0]=~((~c[3]&~c[2]&c[0])|(c[0]&~c[2]&~c[1])|(~c[0]&c[2])|(~c[0]&c[1]&c[3])|(~c[1]&~c[3])|(c[0]&c[1]&c[2]));
    assign display[1]=~((~c[0]&~c[1])|(~c[1]&~c[3])|(~c[0]&c[2]&c[3])|(~c[0]&~c[2]&~c[3])|(c[0]&~c[2]&c[3]));
    assign display[2]=~((~c[2]&c[3])|(c[0]&~c[1])|(~c[0]&c[1])|(~c[0]&~c[2]&~c[3])|(~c[0]&c[2]&c[3]));
    assign display[3]=~((c[1]&c[2]&~c[3])|(~c[0]&~c[1]&c[2])|(~c[1]&c[2]&c[3])|(c[1]&~c[2]&c[3])|(c[0]&~c[2]&~c[3])|(~c[1]&~c[2]&~c[3]));
    assign display[4]=~((c[2]&~c[3])|(c[0]&c[1])|(c[0]&c[2])|(~c[1]&~c[3]));
    assign display[5]=~((c[0]&~c[1])|(c[0]&c[2])|(~c[2]&~c[3])|(~c[0]&c[1]&~c[2])|(~c[0]&c[1]&~c[3]));
    assign display[6]=~((c[0]&~c[1])|(c[2]&~c[3])|(c[0]&c[1]&c[3])|(~c[0]&c[1]&~c[2])|(~c[1]&c[2]&c[3]));
endmodule