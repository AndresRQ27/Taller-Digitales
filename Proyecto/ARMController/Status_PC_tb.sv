module Status_PC_tb();

	//input
	logic clk;
	logic [31:0] pc_prim, pc;

	//intantiate device under test
	Status_PC DUT (clk, pc_prim, pc);

	//apply inputs one at a time
	//checking results
	initial begin
		clk = 0; pc_prim = 32'b000;#10;
		pc_prim = 32'b001;#10;
		pc_prim = 32'b010;#10;
		pc_prim = 32'b011;#10;
		pc_prim = 32'b100;#10;
		pc_prim = 32'b101;#10;
		pc_prim = 32'b110;#10;
		pc_prim = 32'b111;#10;
		pc_prim = 32'b1000;#10;
		pc_prim = 32'b1001;#10;
		pc_prim = 32'b1010;#10;
		
		
		
				
	end
	
	always 
		#5 clk = ~clk;

endmodule