
module adder #(parameter DATA_WIDTH = 4)(input [DATA_WIDTH-1:0] a, input [DATA_WIDTH-1:0] b, input cin, output [DATA_WIDTH-1:0] s, 
	output N, output Z, output cout, output O);
	
	//logic buses to calculate the values
	logic [DATA_WIDTH:0] bus;
	logic [DATA_WIDTH-1:0] bb;
	
	assign bb = cin ? ~b : b;
	assign bus = a + bb + cin;
	
	assign cout = bus[DATA_WIDTH];
	assign s = bus[DATA_WIDTH-1:0];
	
	assign N = s[DATA_WIDTH-1];
	assign Z = &(~s);
	assign O = ((~a[DATA_WIDTH-1])&(~b[DATA_WIDTH-1])&(s[DATA_WIDTH-1]))|((a[DATA_WIDTH-1])&(b[DATA_WIDTH-1])&(~s[DATA_WIDTH-1]));
	
endmodule 