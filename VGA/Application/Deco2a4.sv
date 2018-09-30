module Deco2a4 (
	input logic [1:0] selection, //Selection
	output logic [3:0] y         // Outputs
);
	always_comb
		case(selection)
			2'b00: y <= 4'b0001;
			2'b01: y <= 4'b0010;
			2'b10: y <= 4'b0100;
			2'b11: y <= 4'b1000;
			default: y <= 4'b0000;
		endcase // state

endmodule