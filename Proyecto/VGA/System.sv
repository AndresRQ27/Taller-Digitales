`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Steven Astorga - Steven Avila - Luis Saborio
// Module Name: Top del sistema de la VGA
//////////////////////////////////////////////////////////////////////////////////
module System(
			input wire clock,
			output wire hsync,
			output wire vsync,
			output wire [7:0] red,
			output wire [7:0] green,
			output wire [7:0] blue,
			output wire blank,
			output wire clkVGA 
);

//------------------------------------------
//DECLARACION DE VARIABLES
//------------------------------------------
wire [9:0] px, py;
wire [7:0] rgb;
wire [10:0] dir;
wire [31:0] dato;
//------------------------------------------
//DECLARACION DE VARIABLES
//------------------------------------------

//------------------------------------------
//INSTANCIAS
//------------------------------------------
divisorFrecuencia clk25MHz(
		.clock(clock),
		.clk25Mhz(clkVGA)
);

controladorVGA controladorVGA(
		.clock(clkVGA),
		.hsync(hsync),
		.vsync(vsync),
		.video_on(blank),
		.pixelX(px),
		.pixelY(py)
);

Generador generador(
		.clock(clock),
		.pixelX(px), 
		.pixelY(py),
		.dato(dato),
		.dir(dir), 
		.RGB(rgb)	
);

memoria memoria(
		.clk(clock),
		.dir(dir),
		.dato(dato)
);

//------------------------------------------
//INSTANCIAS
//------------------------------------------

assign red = rgb;
assign green = rgb;
assign blue = rgb;

endmodule