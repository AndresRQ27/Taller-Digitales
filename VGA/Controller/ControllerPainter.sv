module ControllerPainter (
  input vidOn,
  input reset,
  input logic [9:0] hCounter,
  input logic [9:0] vCounter,
  input logic [23:0] color,
  output logic [7:0] blue,
  output logic [7:0] green,
  output logic [7:0] red,
  output sync_n,
  output blank_n
  );

  always_ff @(posedge reset, posedge vidOn) begin
    if(reset) begin
      if(vidOn) begin
        sync_n <= 0;
        blank_n <= 0;
        blue <= "00000000";
        green <= "00000000";
        red <= "00000000";
      end else begin
        sync_n <= 1;
        blank_n <= 1;
        blue <= color[23:16];
        green <= color[15:8];
        red <= color[7:0];
      end // end else
    end // if(reset)
	end

endmodule