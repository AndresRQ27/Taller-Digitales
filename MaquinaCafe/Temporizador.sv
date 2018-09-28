module Temporizador (
	input clk,    // Clock
	input [1:0] tiempo,
	input reset ,
	output logic enable_change	
);

	logic [2:1] conteo;
	

	always_ff @(posedge clk, posedge reset) 
		if (reset) conteo <= 2'b00;
		else if (clk) conteo <= conteo + 1;		


	always_comb
		if (tiempo == conteo) enable_change = 0;
		else enable_change = 1;

endmodule