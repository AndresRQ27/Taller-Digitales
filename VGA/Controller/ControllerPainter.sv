module ControllerPainter (
  input vidOn,
  input reset,
  input logic [23:0] color,
  output logic [7:0] blue,
  output logic [7:0] green,
  output logic [7:0] red,
  output logic sync_n,
  output logic blank_n
  );

  always_comb begin
    if(reset) begin
      sync_n <= 0;
      blank_n <= 0;
      blue <= 8'd0;
      green <= 8'd0;
      red <= 8'd0;
    end else if(~vidOn) begin
		sync_n <= 0;
      blank_n <= 0;
      blue <= 8'd0;
      green <= 8'd0;
      red <= 8'd0;
	 end else begin
		sync_n <= 1;
      blank_n <= 1;
      blue <= color[23:16];
      green <= color[15:8];
      red <= color[7:0];
	 end
	end

endmodule