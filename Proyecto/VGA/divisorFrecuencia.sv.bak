`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Steven Astorga - Steven Avila - Luis Saborio
// Module Name: divisor de frecuencia en el reloj
//////////////////////////////////////////////////////////////////////////////////
module divisorFrecuencia(
			input clock,
			output reg clk25Mhz

);

reg counter;

always @(posedge clock) 
	begin
		if(counter == 0)
			begin
				clk25Mhz = 1;
				counter <= 1;
			end
		
		else 
			begin
				clk25Mhz = 0;
				counter <=0;
			end
	end
	
endmodule