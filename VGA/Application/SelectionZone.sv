module SelectionZone (
 input logic [9:0] horizontal,	//horizontal axis values
 input logic [9:0] vertical, // vertical axis values
 input logic reset,
 output logic [1:0] zone	
);

 always_comb begin
  if (reset) zone = 2'b00;
  else if ((horizontal > 464) & (vertical <=  275))
  	zone = 2'b00;
  else if ((horizontal > 464) & (vertical >  275))
  	zone = 2'b01;
  else if ((horizontal <= 464) & (vertical >  275))
  	zone = 2'b10;
  else
  	zone = 2'b11;

endmodule // SelectionZone

endmodule