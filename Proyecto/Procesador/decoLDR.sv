module decoLDR (
	input logic unsigned [31:0] address,
	output logic selection 
	);

	always_comb begin
		if (address < 32'd1024) begin
			selection <= 1'b0;
		end // if (address < 32'd1024)
		//else if ((address > 32'd1035) && (address < 32'd1040)) begin
		//	selection <= 1'b1;
		//end // else if ((address > 32'd1035) && (address < 32'd1040))
		else begin
			selection <= 1'b1;
		end
	end // always_comb

endmodule