module ParalelRegister#(parameter N = 10)
								(input logic [N-1:0] in,
								input  logic clock,
								output logic [N-1:0] out);
	always_ff@(posedge clock)
		if (clock) out <= in;

endmodule
