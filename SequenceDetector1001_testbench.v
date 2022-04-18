module SequenceDetector1001_testbench();
	
	reg clk, rst, in;
	wire found;
	wire [2:0] currentState;
	wire [2:0] nextState;
	
	SequenceDetector1001 DUT(.nextStateOut(nextState), .stateOut(currentState), .clk(clk), .rst(rst), .in(in), .found(found));

	initial begin
		clk <= 0;
		rst <= 0;
	end
	
	always
		#5 clk = ~clk;
	
	always begin
		#2 in = 0;
		
		#10 in = 1;
		#10 in = 0;
		#10 in = 1;
		#10 in = 0;
		#10 in = 1;
		#10 in = 1;
		#10 in = 0;
		#10 in = 0;
		#10 in = 0;
		#10 in = 1;
		#10 in = 0;
		#10 in = 0;
		#10 in = 1;
		#10 in = 0;
		#10 in = 0;
		#10 in = 1;
		#10 in = 1;
		
		#25 $stop;
	end

endmodule
