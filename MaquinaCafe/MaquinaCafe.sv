module MaquinaCafe (input moneda100, input moneda500, input [3:0] cafe, input clockFPGA, input reset,
							input cancelar, output [6:0] displayDinero, output [6:0] displayVuelto);

	logic [3:0] dineroIngresado; //Mostrado en un display
	logic [3:0] dineroVuelto; //Mostrado en un display
	logic iniciarProceso; 
	logic [1:0] tipoCafe;
	logic enable = 1'b0;
	logic [2:0] maquinaDeEstados;
	logic Hz;
	logic [1:0] tiempo;
				
	Contador dinero(moneda100, moneda500, reset, dineroIngresado);
	
	verificador verifica(dineroIngresado, cafe, cancelar, dineroVuelto, iniciarProceso, tipoCafe);
	
	divisor_freq divisor1Hz(clockFPGA, reset, Hz);
	
	state Estado(clockFPGA, enable, maquinaDeEstados);
	
	Tiempos temporizadorDeIngredientes(tipoCafe, Hz, maquinaDeEstados, iniciarProceso, tiempo);
	
	Temporizador temporice(Hz, tiempo, reset, enable);	
	
	decoder_4bits dcd_4b_1(dineroIngresado,displayDinero);
	
	decoder_4bits dcd_4b_2(dineroVuelto,displayVuelto);
							
endmodule