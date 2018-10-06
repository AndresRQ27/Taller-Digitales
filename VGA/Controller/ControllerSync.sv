module ControllerSync #(parameter DATA_WIDTH = 4)(
  input clk,  //clock divided
  input reset,
  output logic hSync,
  output logic vSync,
  output logic [9:0] hCounter,
  output logic [9:0] vCounter,
  output logic vidOn
  );
  
  //Constant  
  logic [9:0] hpixels = 10'd800; //Value of pixels in a horizontal linea = 800
  logic [9:0] vlines = 10'd521; //Number of horizontal lines in the display = 521
  logic [9:0] hBackPorch = 10'd144; //Horizontal back porch = 144 (128+16)
  logic [9:0] hFrontPorch = 10'd784; //Horizontal front porch = 784 (128+16+640)
  logic [9:0] vBackPorch = 10'd31; //Vertical back porch = 31 (2+29)
  logic [9:0] vFrontPorch = 10'd511; //Vertical front porch = 511 (2+29+480+14)
    
  logic vSyncEnable; //Enable for the Vertical counter
    
  //Counter for the horizontal sync signal
  always_ff @(posedge clk or posedge reset) begin
    if(reset) begin
      hCounter <= 10'd0;
    end else if(clk) begin
      if(hCounter == hpixels-10'd1) begin
        //The counter jas reached the end of the pixel count
        hCounter <= 10'd0; //Resets the counter
        vSyncEnable <= 1; //Enable the vertical counter
      end else begin 
        hCounter <= hCounter + 1; //Increment the horizontal counter
        vSyncEnable <= 0; //Leave the vSyncEnable off
      end // end else
    end// end else if
  end // always_ff @(posedge clk, posedge reset)
  
  always_comb begin
    if(hCounter < 10'd128) begin
        hSync <= 0;
    end else begin 
      hSync <= 1;
    end // end else
    //Horizontal Sync Pulse is loew when hCounter is 0 - 127
  end

  always_ff @(posedge clk or posedge reset) begin
    if(reset) begin
      vCounter <= 10'd0;
    end else if (clk && vSyncEnable) begin
      //Increment when enabled
      if(vCounter == vlines-1) begin
        vCounter <= 10'd0; //Reset when the number of lines is reached
      end else begin 
        vCounter <= vCounter + 1; //Increment vertical counter
      end // end else
    end // end else if
  end

  //Vertical sync pulse is low when vCounter is 0 or 1
  always_comb begin
    if(vCounter < 2) begin
      vSync <= 1;
    end else begin
      vSync <= 0;
    end // end else
  end

  //Enable video out when within the porches

  always_comb begin
    if(((hCounter < hFrontPorch) && 
    (hCounter >= hBackPorch)) && 
    (vCounter >= vBackPorch)) begin
      vidOn <= 1;
    end else begin 
      vidOn <= 0;
    end // end else
  end

  //output horizontal and vertical counters

    
endmodule