module verificador (input [3:0] dinero, input [3:0] cafe, input cancelar, output logic [3:0] vuelto, output iniciarProceso, output logic [1:0] tipoCafe);

	logic [3:0] precio, sobrante;
	logic negativo, cero, cout, desbordamiento;

	always_ff @(cafe) begin
		if (cafe == 4'b0001) begin tipoCafe = 2'b00; precio = 4'b0011; end //Cafe expreso
		else if (cafe == 4'b0010) begin tipoCafe = 2'b01; precio = 4'b0100; end //Cafe con leche
		else if (cafe == 4'b0100) begin tipoCafe = 2'b10; precio = 4'b0101; end //Capuccino
		else begin tipoCafe = 2'b11; precio = 4'b0111; end //Mocaccino
	end
	
	adder #(.DATA_WIDTH(4)) costo(dinero,precio,1'b1,sobrante,negativo,cero,cout,desbordamiento);	
	
	assign iniciarProceso = (~cancelar & ~negativo);
	
	always_ff @(negativo,sobrante,vuelto) begin
		if (~negativo) vuelto = sobrante;
		else vuelto = 4'b0000;
	end

endmodule