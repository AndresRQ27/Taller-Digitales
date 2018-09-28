module Tiempos (	
	input [1:0] cafe, 	// Cafes
	input clock_r,  	// Clock reducido a una frecuencia de aproximadamente 1Hz
	input [2:0] maquina,	// Estados de la maquina
	input comenzar,
	output logic [1:0] tiempo 	// Tiempo de salida para 
);


	always_comb
		if(((maquina == 3'b000) & (cafe == 2'b11)) & comenzar)
			tiempo <= 2'b01;
		else if((maquina == 3'b000) & comenzar)
			tiempo <= 2'b10;
		else if(((maquina == 3'b001) & (cafe == 2'b00)) & comenzar)
			tiempo <= 2'b11;
		else if(((maquina == 3'b001) & (cafe == 2'b01)) & comenzar)
			tiempo <= 2'b10;
		else if((maquina == 3'b001)  & comenzar)
			tiempo <= 2'b01;
		else if(((maquina == 3'b010) & (cafe == 2'b00)) & comenzar)
			tiempo <= 2'b00;
		else if(((maquina == 3'b010) & (cafe == 2'b10)) & comenzar)
			tiempo <= 2'b10;
		else if((maquina == 3'b010) & comenzar)
			tiempo <= 2'b01;
		else if(((maquina == 3'b011) & (cafe == 2'b11)) & comenzar)
			tiempo <= 2'b10;
		else if((maquina == 3'b011) & comenzar)
			tiempo <= 2'b00;
		else if((maquina == 3'b100)  & comenzar)
			tiempo <= 2'b01;
		else 
			tiempo <= 2'b00;




endmodule