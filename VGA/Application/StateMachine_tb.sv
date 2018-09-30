module StateMachine_tb();

	logic clk;
	logic swap;
	logic reset;
	logic [2:0] y;
	
	StateMachine DUT(clk, swap,reset, y);
	
	initial begin
	#5 clk = 0; swap = 1; reset=0;

	end
	always 
		#5 clk = ~clk;

endmodule	