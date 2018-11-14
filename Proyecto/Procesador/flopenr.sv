module flopenr #(parameter WIDTH = 8)(
	input logic clk, reset, eneable,
	input logic [WIDTH-1:0] dataInput,
	output logic [WIDTH-1:0] dataOutput);
	
	
	always_ff @(posedge clk, posedge reset)
		if (reset) dataOutput <= 0;
		else if (eneable) dataOutput <= dataInput;
		
endmodule