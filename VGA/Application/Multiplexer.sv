module Multiplexer #(parameter DATA_WIDTH=24) (input [DATA_WIDTH-1:0] function0, 
											input [DATA_WIDTH-1:0] function1, 
											input [DATA_WIDTH-1:0] function2, 
											input [DATA_WIDTH-1:0] function3,
											input [1:0] selection, 
											output [DATA_WIDTH-1:0] y);
	
	logic [DATA_WIDTH-1:0] allFunctions [3:0];
	
	assign allFunctions[0] = function0;
	assign allFunctions[1] = function1;
	assign allFunctions[2] = function2;
	assign allFunctions[3] = function3;
	
	assign y = allFunctions[selection]; //Negate logic output
		
endmodule