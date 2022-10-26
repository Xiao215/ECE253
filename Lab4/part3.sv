module part3(clock, reset, ParallelLoadn, RotateRight, ASRight, Data_IN, Q);
	
	input logic clock, reset, ParallelLoadn, RotateRight, ASRight;
	input logic [3:0] Data_IN;
	output logic [3:0] Q;
	
	logic [3:0]q;
	
	D_flip_flop u (clock, reset, q, Q);
	
	always_comb
		begin
			if (ParallelLoadn==0)
				begin
				q = Data_IN;
				end
			else if (ParallelLoadn ==1 & RotateRight == 1 & ASRight==0)
				begin
				q[3] = Q[0];
				q[2] = Q[3];
				q[1] = Q[2];
				q[0] = Q[1];
				end
			else if (ParallelLoadn == 1 & RotateRight == 1 & ASRight == 1)
				begin
				q[3] = Q[3];
				q[2] = Q[3];
				q[1] = Q[2];
				q[0] = Q[1];
				end
			else if (ParallelLoadn == 1 & RotateRight == 0)
				begin
				q[3] = Q[2];
				q[2] = Q[1];
				q[1] = Q[0];
				q[0] = Q[3];
				end
		end
endmodule

module D_flip_flop(
	input logic clk ,
	input logic reset_b ,
	input logic [3:0] d,
	output logic [3:0] q
	);
	always_ff @(posedge clk)
	begin
		if (reset_b) q <= 4'b0;
		else q <= d;
	end
	
endmodule