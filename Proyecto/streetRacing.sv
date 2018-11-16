module streetRacing(input FPGACLK,
							input reset,
							input PS2CLK,
							input PS2DATA,
							output wire hsync,
							output wire vsync,
							output wire [7:0] red,
							output wire [7:0] green,
							output wire [7:0] blue,
							output wire blank,
							output wire clkVGA, 
							
							output [1:0] LED2
							
);

logic KEY_COUNTER;
logic [7:0] LED;
logic [9:0] playerDato, enemyDato1, enemyDato2;
logic freq_1Hz, freq_jugador;

top ArmProcesor(FPGACLK, ~reset, LED2, playerDato, enemyDato1, enemyDato2);


initial begin
	playerDato = 10'd280;
	enemyDato1 = 10'd0;
	enemyDato2 = 10'd0;	
	freq_1Hz = 0;
end // initial


Keyboard teclado(.CLK(FPGACLK),
				.PS2_CLK(PS2CLK), 
				.PS2_DATA(PS2DATA),
				.LED(LED),
				.LED2(LED2),
				.KEY_COUNTER(KEY_COUNTER)
				);






VGA vgacontrol(
				.clock(FPGACLK),
				.posicionJugador(playerDato),
				.posicionEnemigo1(enemyDato1),
				.posicionEnemigo2(enemyDato2),
				.hsync(hsync),
				.vsync(vsync),
				.red(red),
				.green(green),
				.blue(blue),
				.blank(blank),
				.clkVGA(clkVGA) 
);





divisorFrecuencia1Hz divisor(FPGACLK, freq_1Hz);
frecuenciaJugador freqjugador(FPGACLK, freq_jugador);
/*
/// enemydato1
always_ff @(posedge freq_1Hz) begin 	
	if (enemyDato1 < 10'd480) begin
		enemyDato1 <= enemyDato1 + 10;
	end // if (enemyDato1 < 10'd480)
	else enemyDato1 <= 10;
end


/// enemydato2
always_ff @(posedge freq_1Hz) begin 	
	if (enemyDato2 < 10'd480) begin
		enemyDato2 <= enemyDato2 + 5;
	end // if (enemydato2 < 10'd480)
	else enemyDato2 <= 5;
end

/// player

always_ff @(posedge freq_jugador) begin 
	if (LED2 == 2'b11) begin
		if (playerDato < 10'd440) begin
			playerDato <= playerDato + 10'd5;
		end // if (enemyDato1 < 10'd640)
	end // if (LED2 == 2'b11)
	else if (LED2 == 2'b10) begin
		if (playerDato > 100 ) begin
			playerDato <= playerDato - 10'd5;
		end // if (playerDato > 100 )	
	end // else if (LED2 == 2'b10)
end

*/

endmodule