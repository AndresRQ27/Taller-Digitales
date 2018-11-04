`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Steven Astorga - Steven Avila - Luis Saborio
// Module Name: Interfaz encargada de brindarme la direccion siguiente a acceder
//////////////////////////////////////////////////////////////////////////////////

module Interface(
			input flag,
			input refresh,
			input clk,
			output reg [13:0] direccion
);

wire [13:0] direccionN = direccion + 1'b1; //Se incrementa en 1 la direccion Nueva

always @(posedge clk) 
	begin
		if (flag || refresh)
			if (refresh)
				direccion <= 0;
			else
				direccion <= direccionN;
	end

endmodule
