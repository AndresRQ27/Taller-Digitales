module memoria(
			input clk,
			input [9:0] pixelX,
			input [9:0] pixelY,
			output logic [31:0] dato
);

logic [9:0] posicionJugador; //Los primeros 10 bits es la posicion en X, los segundos 10 bits es la posición en Y
wire [31:0] datoJugador;

initial begin //Inicia la posicion de los elementos
	posicionJugador[9:0] = 10'd280;
end // initial

always_ff @(posedge clk) begin //MUX que elije el color que pinta el vga
	if((pixelX > posicionJugador[9:0] && pixelX < posicionJugador[9:0] + 10'd100)	//Está pintando el area del sprite del jugador
		&& (pixelY > 10'd340 && pixelY < 10'd464)) begin							//El jugador esta entre 340 y 464 en Y siempre, pues solo se mueve en X
		dato <= datoJugador;
	end else if(pixelX < 10'd100 || pixelX > 10'd540) begin //Fondo verde de los margenes
		dato <= 32'h56B000;
	end else begin	//Fondo negro del asfalto
		dato <= 32'h0;
	end
end

carroJugador carroJugador(
	.clk (clk),
	.posX(pixelX - posicionJugador[9:0]),
	.posY(340),
	.dato(datoJugador)
	);

endmodule