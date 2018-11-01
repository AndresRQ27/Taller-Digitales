module Status_PC(
	input logic clk,
	input logic [31:0] pc_prim,
	output logic [31:0] pc
	);
	
	always_ff @(posedge clk)
		begin
			pc <= pc_prim;
		end
		
endmodule