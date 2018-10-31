module extendData (
	input logic [11:0] Instr,    // data input instr  
	input ImmSrc,					//
	output unsigned logic [31:0] ExtImm // 32bit data extended
);

if(ImmSrc) begin 
	assign ExtImm[11:0] = Instr;  // used for LDR or STR 
	assign ExtImm[31:12] = 20'b0;	
end 
else begin
	assign ExtImm[7:0] = Instr[7:0];  // used for data-processing instructions
	assign ExtImm[31:8] = 20'b0;
end



endmodule