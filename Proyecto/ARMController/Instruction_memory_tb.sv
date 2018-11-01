module Instruction_memory_tb();
	
	//input
	logic [31:0] adr, dout;

	//intantiate device under test
	Instruction_memory DUT(adr, dout);

	//apply inputs one at a time
	//checking results
	initial begin
		adr = 32'b00; #10;
		adr = 32'b01; #10; 
		adr = 32'b10; #10; 
		adr = 32'b11; #10;
		adr = 32'b111; #10;
				
	end

endmodule