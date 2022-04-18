module SequenceDetector1001(clk, rst, in, found, stateOut, nextStateOut);

	input clk, rst, in;
	output found;
	output [2:0] stateOut;
	output [2:0] nextStateOut;
	
	parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;
	
	reg found = 0;
	reg[2:0] state = S0;
	reg[2:0] nextState = S0;
	
	assign stateOut = state;
	assign nextStateOut = nextState;
	
	always @(negedge clk) begin
		
		if(rst)
			state <= S0;
		else
			state <= nextState;
			
	end
	
	always @(posedge clk) begin
		case(state)
			S0 : begin
				found <= 0;
				if(in == 1'b1)
					nextState <= S1;
				else
					nextState <= S0;
			end
			S1 : begin
				found <= 0;
				if(in == 1'b0)
					nextState <= S2;
				else
					nextState <= S1;
			end
			S2 : begin
				found <= 0;
				if(in == 1'b0)
					nextState <= S3;
				else
					nextState <= S1;
			end
			S3 : begin
				found <= 0;
				if(in == 1'b1)
					nextState <= S4;
				else
					nextState <= S0;
			end
			S4 : begin
				found <= 1;
				if(in == 1'b1)
					nextState <= S1;
				else
					nextState <= S2;
			end
		endcase
	end
	
endmodule
