module ALU (
	input logic [1:0] ALUControl,    // controls function to do
	input logic [31:0] dataA, // data A
	input logic [31:0] dataB,  // data B
	output logic [31:0] dout  // data output
	
);
always_comb
	case(ALUControl)
		2'b00 : dout = dataA + dataB;
		2'b01 : dout = dataA - dataB;
		2'b10 : dout = dataA & dataB;
		2'b11 : dout = dataA | dataB;
		default: dout = 32'b0;
	endcase // ALUControl




endmodule