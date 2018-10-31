module ALUDecoder (
	input ALUOp,    // Alu operation enable
	input logic [4:1] Funct_cmd, // function command from alu
	input logic Funct_S , // 
	output logic [1:0] ALUControl,
	output logic [1:0] FlagW	
);
always_comb
	if (~ALUOp)begin
		ALUControl = "00";
		FlagW = "00";
	end // if (ALUOp)
	else 
		if (Funct_cmd = 4'b0100)begin
			ALUControl = "00";
			if(Funct_S) FlagW = "11";
			else FlagW = "00";
		end
		if (Funct_cmd = 4'b0010)begin
			ALUControl = "01";
			if(Funct_S) FlagW = "11";
			else FlagW = "00";
		end
		if (Funct_cmd = 4'b0000)begin
			ALUControl = "10";
			if(Funct_S) FlagW = "10";
			else FlagW = "00";
		end
		if (Funct_cmd = 4'b1100)begin
			ALUControl = "11";
			if(Funct_S) FlagW = "10";
			else FlagW = "00";
		end






endmodule

