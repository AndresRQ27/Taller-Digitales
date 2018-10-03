module ControllerSync_tb ();

logic [9:0] hCounter, vCounter;
logic reset, clk,vidOn,hSync,vSync;

ControllerSync DUT(clk,reset,hSync,vSync,hCounter,vCounter,vidOn);

initial begin
	#1 reset = 1; clk = 1;
	#1 reset = 0; clk = 0;
end // initial

always begin
	#1 clk = ~clk;
end // always

endmodule