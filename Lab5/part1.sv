module part1(Clock, Enable, Reset, CounterValue);
    input logic Clock, Enable, Reset;
    output logic [7:0] CounterValue;
    logic [6:0] w;
    tfflop t0(.T(Enable), .Clock(Clock), .Reset(Reset), .Q(CounterValue[0]));
    assign w[0]=CounterValue[0] & Enable;
    tfflop t1(.T(w[0]), .Clock(Clock), .Reset(Reset), .Q(CounterValue[1]));
    assign w[1]=CounterValue[1] & w[0];
    tfflop t2(.T(w[1]), .Clock(Clock), .Reset(Reset), .Q(CounterValue[2]));
    assign w[2]=CounterValue[2] & w[1];
    tfflop t3(.T(w[2]), .Clock(Clock), .Reset(Reset), .Q(CounterValue[3]));
    assign w[3]=CounterValue[3] & w[2];
    tfflop t4(.T(w[3]), .Clock(Clock), .Reset(Reset), .Q(CounterValue[4]));
    assign w[4]=CounterValue[4] & w[3];
    tfflop t5(.T(w[4]), .Clock(Clock), .Reset(Reset), .Q(CounterValue[5]));
    assign w[5]=CounterValue[5] & w[4];
    tfflop t6(.T(w[5]), .Clock(Clock), .Reset(Reset), .Q(CounterValue[6]));
    assign w[6]=CounterValue[6] & w[5];
    tfflop t7(.T(w[6]), .Clock(Clock), .Reset(Reset), .Q(CounterValue[7]));
endmodule

module tfflop(T, Clock, Reset, Q);
    input logic T, Clock, Reset;
    output logic Q;
    always_ff@(posedge Clock) begin
        if (Reset) begin
            Q <= 0;
        end else begin
            Q <= T ^ Q;
        end
    end
endmodule