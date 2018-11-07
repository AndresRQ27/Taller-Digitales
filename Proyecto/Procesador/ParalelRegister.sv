module ParalelRegister#(parameter N = 5)
								(input logic [N-1:0] in_data,
								input  logic clk,
								output logic [N-1:0] out);
	always_ff@(posedge clk)
		if (clk) out <= in_data;

endmodule
