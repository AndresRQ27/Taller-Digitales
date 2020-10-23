module Deco2a4_tb();

	logic [1:0] selection;
	logic  [3:0] y;
	
	Deco2a4 DUT(selection, y);
	
	initial begin
	#5 selection = 2'b00;
	#5 selection = 2'b01;
	#5 selection = 2'b10;
	#5 selection = 2'b11;
	end
	
endmodule	