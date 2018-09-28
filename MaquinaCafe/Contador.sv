

module Contador #(parameter N = 4)(
	input moneda100,    // Clock
	input moneda500, 
	input reset,
	output logic [N-1:0] estado
);

	
	always_ff @(posedge moneda100, posedge  moneda500, posedge reset) 
		//Reinicia el contador a 0
		if (reset) estado <= 4'b0000;
		else if(moneda100)
			begin //Evita que se sobrepase del valor maximo
				if (estado != 4'b1111) estado = estado + 1;
			end
		else if (moneda500) 
			begin //Evita que se sobrepase del valor maximo
				if(estado > 4'b1010) estado <= 4'b1111;
				else estado = estado + 4'b0101;				
			end
			
endmodule