module part3(clock, reset, ParallelLoadn, RotateRight, ASRight, Data_IN, Q);
    input logic [3:0] Data_IN;
    input logic clock, reset, ParallelLoadn, RotateRight, ASRight;
    logic [3:0] result;
    output logic [3:0] Q;
    always_ff @(posedge clock)
    begin
        if(ParallelLoadn == 0) begin
                Q <= Data_IN;
            end else if (RotateRight == 0) begin
                Q <= {Q[2:0], Q[3]};
            end else if (RotateRight == 0) begin
                Q<= {Q[2:0], Q[3]};
            end else if (ASRight == 0) begin
                Q<= {Q[0], Q[3:1]};
            end else begin
                Q<= {Q[3], Q[3:1]};
        end
    end
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
module mux2to1(x, y, s, out);
    input logic x, y, s;
    output logic out;
    assign out = s ? y : x;
endmodule