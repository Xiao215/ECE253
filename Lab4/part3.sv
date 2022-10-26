module part3(clock, reset, ParallelLoadn, RotateRight, ASRight, Data_IN, Q);
    input logic [3:0] Data_IN;
    input logic clock, reset, ParallelLoadn, RotateRight, ASRight;
    output logic [3:0] Q;
    assign Q=Data_IN;
    logic [3:0] result;
    assign result= Q;
    part3a p1(.left(result[0]), .right(result[2]), .clock(clock), .reset(reset), .loadn(ParallelLoadn), .LoadLeft(RotateRight), .D(result[3]), .Q(Q[3]));
    part3a p2(.left(result[3]), .right(result[1]), .clock(clock), .reset(reset), .loadn(ParallelLoadn), .LoadLeft(RotateRight), .D(result[2]),  .Q(Q[2]));
    part3a p3(.left(result[2]), .right(result[0]), .clock(clock), .reset(reset), .loadn(ParallelLoadn), .LoadLeft(RotateRight), .D(result[1]), .Q(Q[1]));
    part3a p4(.left(result[1]), .right(result[3]), .clock(clock), .reset(reset), .loadn(ParallelLoadn), .LoadLeft(RotateRight), .D(result[0]), .Q(Q[0]));

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
        end
        else
        begin
            Q <= w2;
        end
    end
endmodule
module part3b(left, right, LoadLeft,D, loadn, clock, reset, Q, ASRight);
    input logic left, right, LoadLeft, loadn, clock, reset,D, ASRight;
    output logic Q;
    wire logic w1, w2, w3;
    mux2to1 m1(.x(right), .y(left), .s(LoadLeft), .out(w1));
    mux2to1 m2(.x(D), .y(w1), .s(loadn), .out(w2));
    always_ff @(posedge clock)
    begin
        if(reset)
        begin
            Q <= 0;
        end
        else
        begin
            Q <= w3;
        end
    end
endmodule
module mux2to1(x, y, s, out);
    input logic x, y, s;
    output logic out;
    assign out = s ? y : x;
endmodule