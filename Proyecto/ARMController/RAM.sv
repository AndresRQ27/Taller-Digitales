module ram #(parameter N=6, M=32) (
	input  clk,     // Clock
	input  we,      // enable
	input  logic [N-1:0] adr,  // adress
	input  logic [M-1:0] din,  // data input
	output logic [M-1:0] dout  // data output
	
);
	logic [M-1:0] mem [2**N-1:0];   /// creates memory of M rows
	always_ff @(posedge clk)
		if (we) mem [adr] <= din;

	assign dout = mem[adr];


endmodule