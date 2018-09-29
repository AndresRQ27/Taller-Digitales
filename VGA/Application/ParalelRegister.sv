module ParalelRegister#(parameter N = 10)
								(input logic [N-1:0] in,
								input  logic enable,
								output logic [N-1:0] out);
	always_comb
		if (enable) out <= in;

endmodule
