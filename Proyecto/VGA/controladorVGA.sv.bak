`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Steven Astorga - Steven Avila - Luis Saborio
// Module Name: Controlador de la VGA
//////////////////////////////////////////////////////////////////////////////////
module controladorVGA(
			input clock,
			output hsync,
			output vsync,
			output wire video_on,
			output reg [9:0] pixelX,
			output reg [9:0] pixelY

);

initial 
	begin
		pixelX = 0;
		pixelY = 0;
	end
	
wire refreshPx;
wire refreshPy;	
wire h_video_on;
wire v_video_on;

always @(posedge clock)
	begin
		if(refreshPx)
			pixelX <= 0;
		else 
			pixelX <= pixelX + 1'b1;
	end

always @(posedge clock)
	begin
		if(refreshPy)
			pixelY <= 0;
		else
			begin
				if(pixelX == 799)
					pixelY <= pixelY + 1'b1;
				else
					pixelY <= pixelY;
			end
	end

	assign h_video_on = pixelX < 640;
	assign v_video_on = pixelY < 480;
	assign hsync = pixelX < 655 || pixelX > 750;
	assign vsync = pixelY < 489 || pixelY > 490;
	
	assign refreshPx = pixelX ==799;
	assign refreshPy = pixelX ==799 && pixelY==524;
	assign video_on = h_video_on && v_video_on;
	
endmodule
	


