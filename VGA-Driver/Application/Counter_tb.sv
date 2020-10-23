module Counter_tb #(parameter M = 3)();

logic clk, reset;
logic [M-1:0] out;

Counter #(M) DUT (clk, reset, out);

initial begin
#1 reset = 1;
#1 reset = 0;
end

always begin
#5 clk = 1;
#5 clk = 0;
end


endmodule