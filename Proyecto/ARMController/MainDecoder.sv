module MainDecoder (
	input logic [1:0] Op,    // operation choose
	input Funct5, // function 5th bit
	input Funct0,  // function 0 bit
	output Branch,
	output MemtoReg,
	output MemW,
	output ALUSrc,
	output logic [1:0] ImmSrc,
	output RegW,
	output logic [1:0] RegSrc,
	output ALUOp
);

always_comb
	if((Op = "00")&&(~Funct5))begin
		Branch = 0;
		MemtoReg = 0;
		MemW = 0;
		ALUSrc = 0;
		ImmSrc = "00";
		RegW = 1;
		RegSrc = "00";
		ALUOp = 1;		
	end // if((Op = "00")&&(~Funct5))
	else if((Op = "00")&&(Funct5))begin
		Branch = 0;
		MemtoReg = 0;
		MemW = 0;
		ALUSrc = 1;
		ImmSrc = "00";
		RegW = 1;
		RegSrc = "00";
		ALUOp = 1;		
	end // else if((Op = "00")&&(Funct5))
	else if((Op = "01")&&(~Funct0))begin
		Branch = 0;
		MemtoReg = 0;
		MemW = 1;
		ALUSrc = 1;
		ImmSrc = "01";
		RegW = 0;
		RegSrc = "10";
		ALUOp = 0;
	end // if((Op = "01")&&(~Funct0))
	else if((Op = "01")&&(Funct0))begin
		Branch = 0;
		MemtoReg = 1;
		MemW = 0;
		ALUSrc = 1;
		ImmSrc = "01";
		RegW = 1;
		RegSrc = "00";
		ALUOp = 0;
	end // else if((Op = "01")&&(Funct0))
	else if(Op = "10")begin
		Branch = 1;
		MemtoReg = 0;
		MemW = 0;
		ALUSrc = 1;
		ImmSrc = "10";
		RegW = 0;
		RegSrc = "01";
		ALUOp = 0;
	end // else if(Op = "10")		
			
	
	

endmodule