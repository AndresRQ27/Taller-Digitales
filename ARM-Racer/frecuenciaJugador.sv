module frecuenciaJugador(
			input clock,
			output reg clk_1Hz

);

reg [23:0] counter;

always @(posedge clock) 
	begin
		if(counter == 0)
			begin
				clk_1Hz = 1;
				counter <= counter + 1;
			end
		
		else 
			begin
				clk_1Hz = 0;
				counter <= counter +1 ;
			end
	end
	
endmodule