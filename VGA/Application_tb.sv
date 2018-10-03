module Application_tb ();

logic clk, reset, swap;
logic [9:0] horizontal, vertical;
logic [23:0] color;


contadorV_H cont(clk, reset, horizontal, vertical);
Application DUT (clk, reset, swap, horizontal, vertical, color);



initial begin
#1 reset = 1;
#1 reset = 0;
#1 swap = 0;

end






always begin
#1 clk = 1;
#1 clk = 0;
end

always begin
	#500 swap = 1;
	#10 swap = 0;
end

endmodule

