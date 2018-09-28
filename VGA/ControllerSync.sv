module ControllerSync #(parameter DATA_WIDTH = 4)(
  input clk,  //clock divided
  input reset,
  output hSync,
  output vSync,
  output logic [9:0] hCounter,
  output logic [9:0] vCounter,
  output vidOn
  );
  
  //Constant  
  logic [9:0] hpixels = "1100100000"; //Value of pixels in a horizontal linea = 800
  logic [9:0] vlines = "1000001001"; //Number of horizontal lines in the display = 521
  logic [9:0] hBackPorch = "0010010000"; //Horizontal back porch = 144 (128+16)
  logic [9:0] hFrontPorch = "1100010000"; //Horizontal front porch = 784 (128+16+640)
  logic [9:0] vBackPorch = "0000011111"; //Vertical back porch = 31 (2+29)
  logic [9:0] vFrontPorch = "0111111111"; //Vertical front porch = 511 (2+29+480)
    
  logic [9:0] hCounterSync, vCounterSync; //These are Horizontal and Vertical counters
    
  logic vSyncEnable; //Enable for the Vertical counter
    
  //Counter for the horizontal sync signal
  always_ff @(posedge clk or negedge reset) begin
    if(~reset) begin
      hCounterSync <= "0000000000";
    end else if(clk) begin
      if(hCounterSync == hpixels-1) begin
        //The counter jas reached the end of the pixel count
        hCounterSync <= "0000000000"; //Resets the counter
        vSyncEnable <= 1; //Enable the vertical counter
      end else begin 
        hCounterSync <= hCounterSync + 1; //Increment the horizontal counter
        vSyncEnable <= 0; //Leave the vSyncEnable off
      end // end else
    end// end else if
  end // always_ff @(posedge clk, posedge reset)
  
  always_comb
    if(hCounterSync < 128) begin
        hSync <= 0;
    end else begin 
      hSync <= 1;
    end // end else
    //Horizontal Sync Pulse is loew when hCounter is 0 - 127

  always_ff @(posedge clk or negedge reset)
    if(~reset) begin
      vCounterSync <= "0000000000";
    end else if (clk && vSyncEnable) begin
      //Increment when enabled
      if(vCounterSync == vlines-1) begin
        vCounterSync <= "0000000000"; //Reset when the number of lines is reached
      end else begin 
        vCounterSync <= vCounterSync + 1; //Increment vertical counter
      end // end else
    end // end else if

  //Vertical sync pulse is low when vCounter is 0 or 1
  always_comb 
    if(vCounterSync < 2) begin
      vSync = 0;
    end else begin
      vSync = 1;
    end // end else

  //Enable video out when within the porches

  always_comb
    if(((hCounterSync < hFrontPorch) && 
    (hCounterSync >= hBackPorch)) && 
    (vCounterSync >= vBackPorch)) begin
      vidOn <= 1;
    end else begin 
      vidOn <= 0;
    end // end else

  //output horizontal and vertical counters
  assign hCounter = hCounterSync;
  assign vCounter = vCounterSync;
    
endmodule