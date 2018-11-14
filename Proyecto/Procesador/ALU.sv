module ALU #(parameter width = 32)
		(input logic [width-1:0] a,
		input logic [width-1:0] b,
		input logic [1:0] control,
		output logic [width-1:0] result,
		output logic [3:0] ALUFlags); //Flags en orden: n,z,c,v

	logic [width:0] bus;
	
	always_ff@(*) begin
        
		if(control == 2'b00) begin
			bus <= a + b;
			ALUFlags[1] <= bus[width]; // c
			result <= bus[width-1:0]; 
			ALUFlags[3] <= result[width-1]; // n
			ALUFlags[2] <= &(~result); // z
			ALUFlags[0] <= ((~((a[width-1]^b[width-1]))^control[1])&(a[width-1]^result[width-1])); // v
			
		end

		else if(control == 2'b01) begin
			bus <= a - b;
			ALUFlags[1] <= 0; // c
			result <= a - b; 
			ALUFlags[3] <= result[width-1]; // n
			ALUFlags[2] <= &(~result); // z
			ALUFlags[0] <= ((~((a[width-1]^b[width-1]))^control[1])&(a[width-1]^result[width-1])); // v
		end

		else if(control == 2'b10) begin
			bus <= 0;
			result <= bus[width-1:0]; 
			ALUFlags[1] <= 0;
			ALUFlags[3] <= result[width-1]; // n
			ALUFlags[2] <= &(~result); // z
			ALUFlags[0] <= ((~((a[width-1]^b[width-1]))^control[1])&(a[width-1]^result[width-1])); // v
		end

		else begin
			bus <= 0;
			result <= bus[width-1:0]; 
			ALUFlags[1] <= 0;
			ALUFlags[3] <= result[width-1]; // n
			ALUFlags[2] <= &(~result); // z
			ALUFlags[0] <= ((~((a[width-1]^b[width-1]))^control[1])&(a[width-1]^result[width-1])); // v
		end

	end // always_comb


endmodule // ALU
