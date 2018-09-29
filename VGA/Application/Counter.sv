module Counter #(parameter N=24)(
	input clk,    // Clock
	input reset, // reset
	output logic [N-1:0] out
	
);
	always_ff @(posedge clk or posedge  reset)
		if (reset) out <= 0;
		else       out <= out + 1;

endmodule