module ClkDivisor #(parameter N = 2)(
	input logic clock, 
	input logic reset,
	output logic newClock
	);

 logic[N - 1:0] count;
 
 always_ff @(posedge clock, posedge reset)
  begin
  
   if(reset)
    begin
     count <= 0;
     newClock <= 0;
    end
	 
   else
    begin
     count <= count + 1;
	  
     if(count == 0)
      begin
       newClock <= !newClock;       
      end
     
    end
	 
  end
  
endmodule