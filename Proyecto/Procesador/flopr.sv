module flopr #(parameter WIDTH = 8)(
	input logic clk, reset,
	input logic [WIDTH-1:0] dataInput,
	output logic [WIDTH-1:0] dataOutput);
	
	always_ff @(posedge clk, posedge reset)
		if (reset) dataOutput <= 0;
		else dataOutput <= dataInput;
		
endmodule