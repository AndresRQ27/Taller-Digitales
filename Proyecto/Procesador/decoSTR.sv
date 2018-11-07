module decoSTR (
	input logic unsigned [31:0] address,
	output logic writePlayer,
	output logic writeEnemy1,
	output logic writeEnemy2,
	output logic writeMemory
	);
	

	always_comb begin
		if (address < 32'd1024 )begin
			writePlayer <= 1'b0;
			writeEnemy1 <= 1'b0;
			writeEnemy2 <= 1'b0;
			writeMemory <= 1'b1;
		end // if (address < 32'd1024 )
		else if (address < 32'd1028 )begin
			writePlayer <= 1'b1;
			writeEnemy1 <= 1'b0;
			writeEnemy2 <= 1'b0;
			writeMemory <= 1'b0;
		end // else if (address < 32'd1028 )
		else if (address < 32'd1032 )begin
			writePlayer <= 1'b0;
			writeEnemy1 <= 1'b1;
			writeEnemy2 <= 1'b0;
			writeMemory <= 1'b0;
		end // else if (address < 32'd1032 )
		else if (address < 32'd1036 )begin
			writePlayer <= 1'b0;
			writeEnemy1 <= 1'b0;
			writeEnemy2 <= 1'b1;
			writeMemory <= 1'b0;
		end // else if (address < 32'd1036 )
		else begin
			writePlayer <= 1'b0;
			writeEnemy1 <= 1'b0;
			writeEnemy2 <= 1'b0;
			writeMemory <= 1'b0;
		end
	end // always_comb

endmodule