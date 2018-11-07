module decoSTR (
	input logic [31:0] unsigned address
	output logic writePlayer,
	output logic writeEnemy1,
	output logic writeEnemy2,
	output logic writeMemory
	);

	always_comb begin
		if (address < 32'd1024 )begin
			writePlayer <= 0;
			writeEnemy1 <= 0;
			writeEnemy2 <= 0;
			writeMemory <= 1;
		end // if (address < 32'd1024 )
		else if (address < 32'd1028 )begin
			writePlayer <= 1;
			writeEnemy1 <= 0;
			writeEnemy2 <= 0;
			writeMemory <= 0;
		end // else if (address < 32'd1028 )
		else if (address < 32'd1032 )begin
			writePlayer <= 0;
			writeEnemy1 <= 1;
			writeEnemy2 <= 0;
			writeMemory <= 0;
		end // else if (address < 32'd1032 )
		else if (address < 32'd1036 )begin
			writePlayer <= 0;
			writeEnemy1 <= 0;
			writeEnemy2 <= 1;
			writeMemory <= 0;
		end // else if (address < 32'd1036 )
	end // always_comb

endmodule