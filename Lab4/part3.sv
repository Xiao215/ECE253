module part3(clock, reset, ParallelLoadn, RotateRight, ASRight, Data_IN, Q);
    input logic [3:0] Data_IN;
    input logic clock, reset, ParallelLoadn, RotateRight, ASRight;
    output logic [3:0] Q;
    logic [3:0] result;
    assign result = Data_IN;
    part3b p1(.left(Data_IN[0]), .right(Data_IN[2]), .clock(clock), .reset(reset), .loadn(ParallelLoadn), .LoadLeft(RotateRight), .D(Data_IN[3]), .Q(Q[3]), .ASRight(ASRight));
    part3a p2(.left(Data_IN[3]), .right(Data_IN[1]), .clock(clock), .reset(reset), .loadn(ParallelLoadn), .LoadLeft(RotateRight), .D(Data_IN[2]),  .Q(Q[2]));
    part3a p3(.left(Data_IN[2]), .right(Data_IN[0]), .clock(clock), .reset(reset), .loadn(ParallelLoadn), .LoadLeft(RotateRight), .D(Data_IN[1]), .Q(Q[1]));
    part3a p4(.left(Data_IN[1]), .right(Data_IN[3]), .clock(clock), .reset(reset), .loadn(ParallelLoadn), .LoadLeft(RotateRight), .D(Data_IN[0]), .Q(Q[0]));
endmodule


module part3a(left, right, LoadLeft,D, loadn, clock, reset, Q);
    input logic left, right, LoadLeft, loadn, clock, reset,D;
    output logic Q;
    wire logic w1, w2;
    mux2to1 m1(.x(right), .y(left), .s(LoadLeft), .out(w1));
    mux2to1 m2(.x(D), .y(w1), .s(loadn), .out(w2));
    always_ff @(posedge clock)
    begin
        if(reset) begin
            Q <= 0;
            D<=0;
        end
        else
        begin
            Q <= w2;
            D<=w2;
        end
    end
endmodule
module part3b(left, right, LoadLeft,D, loadn, clock, reset, Q, ASRight);
    input logic left, right, LoadLeft, loadn, clock, reset,D, ASRight;
    output logic Q;
    wire logic w1, w2, w3;
    mux2to1 m1(.x(right), .y(left), .s(LoadLeft), .out(w1));
    mux2to1 m2(.x(D), .y(w1), .s(loadn), .out(w2));
    mux2to1 m3(.x(w2), .y(D), .s(ASRight), .out(w3));
    always_ff @(posedge clock)
    begin
        if(reset)
        begin
            Q <= 0;
            D<=0;
        end
        else
        begin
            Q <= w3;
            D<=w3;
        end
    end
endmodule
module mux2to1(x, y, s, out);
    input logic x, y, s;
    output logic out;
    assign out = s ? y : x;
endmodule