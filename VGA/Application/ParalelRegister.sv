module ParalelRegister#(parameter N = 10)
								(input logic [N-1:0] in,
								input  logic load,
								output logic [N-1:0] out);
	always_ff@(posedge load)
		if (load) out <= in;

endmodule
