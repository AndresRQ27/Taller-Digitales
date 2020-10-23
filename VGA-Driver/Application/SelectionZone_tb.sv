module SelectionZone_tb ();

logic [9:0] horizontal, vertical;
logic reset;
logic [1:0] zone;

SelectionZone DUT (horizontal, vertical, reset, zone);

initial begin
#1 reset = 1; horizontal = 0; vertical = 0;
#1 reset = 0;
#5 horizontal = 10'd600; vertical = 10'd100;
#5 horizontal = 10'd600; vertical = 10'd600;
#5 horizontal = 10'd100; vertical = 10'd600;
#5 horizontal = 10'd100; vertical = 10'd100;

end // initial




endmodule