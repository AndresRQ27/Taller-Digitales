module Register_file_tb();
	
	//input
	logic clk;
	logic WE3;
	logic [3:0] A1, A2, A3;
	logic [31:0] WD3, R15, RD1, RD2;

	//intantiate device under test
	Register_file DUT (clk, WE3, A1, A2, A3, WD3, R15, RD1, RD2);

	//apply inputs one at a time
	//checking results
	initial begin
		clk = 0; WE3 = 0; A1 = 4'b0000; A2 = 4'b0000; A3 = 4'b0000; WD3 = 32'b001; R15 = 32'b0000; #20;
		WE3 = 1; A1 = 4'b0000; A2 = 4'b0000; A3 = 4'b0000; WD3 = 32'b001; R15 = 32'b0001; #20;
		WE3 = 0; A1 = 4'b0000; A2 = 4'b0000; A3 = 4'b0000; WD3 = 32'b001; R15 = 32'b0001; #20;
		WE3 = 1; A1 = 4'b0000; A2 = 4'b0000; A3 = 4'b0000; WD3 = 32'b011; R15 = 32'b0001; #20;
		WE3 = 0; A1 = 4'b0000; A2 = 4'b0000; A3 = 4'b0000; WD3 = 32'b001; R15 = 32'b0001; #20;
		WE3 = 1; A1 = 4'b0000; A2 = 4'b0000; A3 = 4'b0000; WD3 = 32'b111; R15 = 32'b0001; #20;
		
				
	end
	
	always 
		#20 clk = ~clk;

endmodule