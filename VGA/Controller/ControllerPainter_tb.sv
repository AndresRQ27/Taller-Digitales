module ControllerPainter_tb ();

  logic vidOn,reset,blank_n,sync_n;
  logic [23:0] color;
  logic [7:0] blue,green,red;


ControllerPainter DUT(vidOn,reset,color,blue,green,red,blank_n,sync_n);

initial begin
	#1 reset = 1; vidOn = 0; color = 24'd49253;
	#1 reset = 0;
	#1 vidOn = 1;
	#1 color = 24'd10293;
	#1 color = 24'd95846;
	#1 color = 24'd23178;
	#1 vidOn = 0;
end // initial

endmodule