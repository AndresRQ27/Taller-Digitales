module testbench();


	logic clk, reset;
	logic [31:0] playerData, enemyData1, enemyData2, ps2DataInput;

	
	
	// instantiate device to be tested
	top dut(clk, reset, ps2DataInput, playerData, enemyData1, enemyData2);
	

	initial begin
		reset<= 1; ps2DataInput <= 32'b1; #5; reset<= 0; 
	
	end
	// initialize test
	//initial
		//begin
			//reset <= 1; # 22; reset <= 0;
		//end

	// generate clock to sequence tests
	always
		begin
			clk <= 1; # 22; clk <= 0; # 22;
		end
	
	// check that 7 gets written to address 0x64
	// at end of program
	//always @(negedge clk)
		//begin
			//if(MemWrite) begin
			//if(DataAdr === 100 & WriteData === 7) begin
				//$display("Simulation succeeded");
				//$stop;
			//end else if (DataAdr !== 96) begin
				//$display("Simulation failed");
				//$stop;
			//end
		//end
	//end
endmodule