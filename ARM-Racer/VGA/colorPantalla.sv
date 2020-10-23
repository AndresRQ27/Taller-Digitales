module colorPantalla(
			input clk,
			input [9:0] pixelX,
			input [9:0] pixelY,
			input wire [9:0] posicionJugador,
			input wire [9:0] posicionEnemigo1,
			input wire [9:0] posicionEnemigo2,
			output logic [31:0] dato
);

wire [31:0] datoJugador; //Dato del color del jugador
wire [31:0] datoEnemigo1; //Dato del color del enemigo
wire [31:0] datoEnemigo2; //Dato del color del enemigo

/*
logic [9:0] posicionJugador; //La posicion del jugador en X
logic [9:0] posicionEnemigo1; //La posicion del enemigo1 en Y
logic [9:0] posicionEnemigo2; //La posicion del eneimgo2 en Y

initial begin //Inicia la posicion de los elementos
	posicionJugador[9:0] = 10'd280;
	posicionEnemigo1[9:0] = 10'd0;
	posicionEnemigo2[9:0] = 10'd0;
end // initial*/

always_ff @(posedge clk) begin //MUX que elije el color que pinta el vga
	if((pixelX > posicionJugador && pixelX < posicionJugador + 10'd100)	//Está pintando el area del sprite del jugador
		&& (pixelY > 10'd340 && pixelY < 10'd464)) begin							//El jugador esta entre 340 y 464 en Y siempre, pues solo se mueve en X
		dato <= datoJugador;
	end else if((pixelX > 10'd150 && pixelX < 10'd250) 
					&& (pixelY > posicionEnemigo1 && pixelY < posicionEnemigo1 + 10'd124)) begin
		dato <= datoEnemigo1;
	end else if((pixelX > 10'd400 && pixelX < 10'd500) 
					&& (pixelY > posicionEnemigo2 && pixelY < posicionEnemigo2 + 10'd124)) begin
		dato <= datoEnemigo2;			
	end else if(pixelX < 10'd100 || pixelX > 10'd540) begin //Fondo verde de los margenes
		dato <= 32'h56B000;
	end else begin	//Fondo negro del asfalto
		dato <= 32'h0;
	end
end

carroJugador carroJugador(
	.clk (clk),
	.posX(pixelX - posicionJugador),
	.posY(pixelY - 340),
	.dato(datoJugador)
	);

carroEnemigo carroEnemigo1(
	.clk(clk),
	.posX(pixelX - 150),
	.posY(pixelY - posicionEnemigo1),
	.dato(datoEnemigo1)
	);
	
carroEnemigo carroEnemigo2(
	.clk(clk),
	.posX(pixelX - 400),
	.posY(pixelY - posicionEnemigo2),
	.dato(datoEnemigo2)
	);
	
endmodule