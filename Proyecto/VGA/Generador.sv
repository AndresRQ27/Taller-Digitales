module Generador(
			input clock,
			input [9:0] pixelX, 
			input [9:0] pixelY,
			input [31:0] dato,
			output logic [7:0] red,
			output logic [7:0] green,
			output logic [7:0] blue				
);

//Se obtienen los rgb de memoria para luego ser asiganados al RGB que sale de la VGA
always @(posedge clock) 
	begin
		red = dato[31:16];
		green <= dato[15:8];
		blue <= dato[7:0];
	end

endmodule