`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Steven Astorga - Steven Avila - Luis Saborio
// Module Name: Generador de imagenes para la VGA
//////////////////////////////////////////////////////////////////////////////////
module Generador(
			input clock,
			input [9:0] pixelX, 
			input [9:0] pixelY,
			input [31:0] dato,
			output  [10:0] dir, 
			output reg [7:0] RGB	
);

wire refresh = (pixelX == 0) && (pixelY == 0); //Para cuando se reinicia la VGA y hay que refrescarla

wire flag = pixelX < 80 && pixelY < 80; //Area de la VGA que se habilita segun el tamano de la imagen
								

wire [13:0] sigDir; //Variable para direccion, es la interfaz entre el vga y la memoria

//Instancia del modulo que va dando la direccion siguiente para acceder a memoria
Interface interfaceIns(
		.flag(flag),
		.refresh(refresh),
		.clk(clock),
		.direccion(sigDir)

);

//Se asigna la siguiente direccion a acceder
assign dir = sigDir[13:3]; //Se hace un corrimiento de 3 por que se no la imagen sale repetifa y mas pequena

//Variable para los rgb de memoria
reg [7:0] rgb;

//Se obtienen los rgb de memoria para luego ser asiganados al RGB que sale de la VGA
always @(posedge clock) 
	begin
		case(sigDir[1:0])
			2'b00: rgb = dato[7:0];
			2'b01: rgb = dato[15:8];
			2'b10: rgb = dato[23:16];
			2'b11: rgb = dato[31:24];
			default: rgb = 0;
		endcase
	end

//Se asignan los rgb de memoria al RGB de salida de la VGA
always @(*) 
	begin
		if (flag)
			RGB = rgb;
		else
			RGB = 8'b11111111;
	end

endmodule