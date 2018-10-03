module ParalelRegister_tb #(parameter M = 4)();

logic [M-1:0] in , out;
logic clock;

ParalelRegister #(M) DUT (in, clock, out);

initial begin
#1 clock = 1;
#2 in = 4'b0001;
#2 in = 4'b0010; clock = 0;
#2 in = 4'b0011;
#2 in = 4'b0100; clock = 1;
#2 in = 4'b1100;


end // initial


endmodule