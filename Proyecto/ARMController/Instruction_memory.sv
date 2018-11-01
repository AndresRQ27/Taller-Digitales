module Instruction_memory (
	input logic [31:0] adr,
	output logic [31:0] dout);

	always_comb
		case(adr)
			32'b00: dout = 32'b011;
			32'b01: dout = 32'b110;
			32'b10: dout = 32'b100;
			32'b11: dout = 32'b010;
			default: dout = 32'b000;
		endcase

endmodule