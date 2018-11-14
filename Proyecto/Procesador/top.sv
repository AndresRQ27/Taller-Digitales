module top(
	input logic clk, reset,
	input logic [31:0] ps2DataInput,
	output logic [31:0] playerData, enemyData1, enemyData2);

	logic [31:0] PC, Instr, ReadData, memData, WriteData, DataAdr, ps2DataOutput;
	logic wePlayer, weEnemy1, weEnemy2, weMemory, 
	weP, weE1, weE2, weM, selection, MemWrite;
	
	
	//STR sprites eneable
	always_comb begin
		weP = wePlayer & MemWrite;
		weE1 = weEnemy1 & MemWrite;
		weE2 = weEnemy2 & MemWrite;
		weM = weMemory & MemWrite;
	end
		

	// instantiate processor and instruction memory
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr,
		WriteData, ReadData);
		
	
	imem imem(PC, Instr);
	
	
	//Instantiate decoSTR, decoLDR and mux2
	decoSTR decoSTR(DataAdr, wePlayer, weEnemy1, weEnemy2, weMemory);
	decoLDR decoLDR(DataAdr, selection);
	mux2 #(32) mux2(memData, ps2DataOutput, selection, ReadData);
	
	
	//Instantiate registers of sprites, memoryData and ps2 data
	flopenr  #(32) regPlayer(clk, reset, weP, WriteData, playerData);
	flopenr  #(32) regEnemy1(clk, reset, weE1, WriteData, enemyData1);
	flopenr  #(32) regEnemy2(clk, reset, weE2, WriteData, enemyData2);
	flopr #(32) ps2Data(clk, reset, ps2DataInput, ps2DataOutput);
	dmem dmem(clk, weM, DataAdr, WriteData, memData);
	
	
	

endmodule