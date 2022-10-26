module part3(input logic clock, reset, ParallelLoadn,RotateRight, ASRight, input logic[3:0] Data_IN, output logic[3:0] Q);
	logic [3:0] internal;
	
	D_flipflop d0 (clock, reset, internal, Q);
	
	always_comb
	begin
		if(ParallelLoadn) 
		begin
			if(!RotateRight) 
			begin
				internal[3] = Q[2];
				internal[2] = Q[1];
				internal[1] = Q[0];
				internal[0] = Q[3];
			end
			else
			begin
				internal[2] = Q[3];
				internal[1] = Q[2];
				internal[0] = Q[1];
			    if(ASRight)
				begin
				internal[3] = Q[3];
				end
				else
				begin
				internal[3] = Q[0];
				end
			end
		end
		else
		begin
		    internal = Data_IN;
		end
	end
endmodule
				
				
module D_flipflop(input logic clock, reset_b, input logic [3:0] D, output logic [3:0] Q);
	always_ff @(posedge clock)
	begin
		if (reset_b) Q <= 4'b0;
		else Q <= D;
	end
endmodule