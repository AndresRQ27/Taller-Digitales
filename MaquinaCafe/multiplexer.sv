module multiplexer #(parameter DATA_WIDTH=4) (input [DATA_WIDTH-1:0] function0, input [DATA_WIDTH-1:0] function1, input [DATA_WIDTH-1:0] function2, input [DATA_WIDTH-1:0] function3, 
													 input [DATA_WIDTH-1:0] function4, input [DATA_WIDTH-1:0] function5, input [DATA_WIDTH-1:0] function6,	input [DATA_WIDTH-1:0] function7, 
													 input [DATA_WIDTH-1:0] function8,input [DATA_WIDTH-1:0] function9, input [DATA_WIDTH-1:0] function10, input [DATA_WIDTH-1:0] function11,
													 input [DATA_WIDTH-1:0] function12,input [DATA_WIDTH-1:0] function13, input [DATA_WIDTH-1:0] function14, input [DATA_WIDTH-1:0] function15, 
													 input [3:0] selection, output [DATA_WIDTH-1:0] y);
	
	logic [DATA_WIDTH-1:0] allFunctions [15:0];
	
	assign allFunctions[0] = function0;
	assign allFunctions[1] = function1;
	assign allFunctions[2] = function2;
	assign allFunctions[3] = function3;
	assign allFunctions[4] = function4;
	assign allFunctions[5] = function5;
	assign allFunctions[6] = function6;
	assign allFunctions[7] = function7;
	assign allFunctions[8] = function8;
	assign allFunctions[9] = function9;
	assign allFunctions[10] = function10;
	assign allFunctions[11] = function11;
	assign allFunctions[12] = function12;
	assign allFunctions[13] = function13;
	assign allFunctions[14] = function14;
	assign allFunctions[15] = function15;
	
	assign y = allFunctions[selection]; //Negate logic output
		
endmodule