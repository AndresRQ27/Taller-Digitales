module regfile(input logic clk, reset,
	input logic we3,
	input logic [3:0] ra1, ra2, wa3,
	input logic [31:0] wd3, r15,
	output logic [31:0] rd1, rd2);
	
	logic [14:0] [31:0]rf;
	// three ported register file
	// read two ports combinationally
	// write third port on rising edge of clock
	// register 15 reads PC + 8 instead
	
	always_ff @(negedge clk, posedge reset)begin
			if (reset) begin
				rf <= 0;
			end
			else if (we3)begin
				rf[wa3] <= wd3;
			end
		end
	
	assign rd1 = (ra1 == 4'b1111) ? r15 : rf[ra1];
	assign rd2 = (ra2 == 4'b1111) ? r15 : rf[ra2];
	
endmodule