module ParalelRegister_tb #(parameter M = 4)();

logic [M-1:0] in , out;
logic enable;

ParalelRegister #(M) DUT (in, enable, out);

initial begin
#1 enable = 1;
#2 in = 4'b0001;
#2 in = 4'b0010; enable = 0;
#2 in = 4'b0011;
#2 in = 4'b0100; enable = 1;
#2 in = 4'b1100;


end // initial


endmodule