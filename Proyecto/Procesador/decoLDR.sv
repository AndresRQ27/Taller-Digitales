module decoLDR (
	input logic [31:0] unsigned address	
	output logic loadPS2, 
	output logic loadMemory
	);

	always_comb begin
		if (address < 32'd1024) begin
			loadMemory <= 1;
			loadPS2 <= 0;
		end // if (address < 32'd1024)
		else if ((address > 32'd1035) && (address < 32'd1040)) begin
			loadMemory <= 0;
			loadPS2 <= 1;
		end // else if ((address > 32'd1035) && (address < 32'd1040))
	end // always_comb

endmodule