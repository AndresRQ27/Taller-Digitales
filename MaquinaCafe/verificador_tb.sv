module verificador_tb();
	
	//input
	logic [3:0] dinero, cafe;
	logic cancelar;
	
	//output
	logic [3:0] vuelto;
	logic [1:0] tipoCafe;
	logic iniciarProceso;	

	//intantiate device under test
	verificador DUT(dinero, cafe, cancelar, vuelto, iniciarProceso, tipoCafe);

	//apply inputs one at a time
	//checking results
	initial begin
		dinero=4'b0000; cafe=4'b0001; cancelar=1'b0; #10; //No suficiente dinero, cafe 1
		dinero=4'b0011; #10; //Suficiente dinero, cafe 1
		dinero=4'b0100; #10; //Mas suficiente dinero, cafe 1
		
		cafe=4'b1000; #10; //No suficiente dinero, cafe 4
		dinero=4'b0111; #10; //Suficiente dinero, cafe 4
		dinero=4'b1000; #10; //Mas suficiente dinero, cafe 4
		
		cancelar=1'b1; //prueba cancelando la orden
				
	end

endmodule