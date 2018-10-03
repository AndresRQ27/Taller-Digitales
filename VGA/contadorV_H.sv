//contador vertical y horizontal
module contadorV_H (
	input clk,    // Clock
	input reset,  // reset
	output logic [9:0] horizontal, //posicion X
	output logic [9:0] vertical  //posicion Y
);
	always_ff @(posedge clk or posedge  reset or posedge horizontal) begin
		if(reset) begin
				horizontal <= 0;
				vertical <= 0;
			end
		else  
			begin
				horizontal <= horizontal + 1;
				if ( horizontal == 0 )
					vertical <= vertical + 1;
			end
	end //always_ff
	
	


endmodule
