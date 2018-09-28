module divisor_freq (
	input clk,    // Clock
	input reset,  // Asynchronous reset active low
	output Hz
);

	logic [25:0] q;

	always_ff@(posedge clk, posedge reset) begin
		if (reset) 	q <= 0;
		else		q <= q+1;
	end
	
	always_comb begin
		if (q == 0) Hz = 1;
		else Hz = 0;
	end
	

endmodule