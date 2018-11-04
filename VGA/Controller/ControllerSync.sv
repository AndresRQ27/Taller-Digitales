module ControllerSync #(parameter DATA_WIDTH = 4)(
  input clock,  //clock divided
  input reset,
  output logic hSync,
  output logic vSync,
  output logic [9:0] hCounter,
  output logic [9:0] vCounter,
  output logic vidOn
  );
  
  initial
    begin
      hCounter = 0;
      vCounter = 0;
    end

  logic refreshHSync, refreshVSync;
  logic hVideoOn, vVideoOn;

  always @(posedge clock, posedge reset) begin 
      if(reset) begin
        hCounter <= 0;
      end else if(refreshHSync) begin
        hCounter <= 0;
      end else begin 
        hCounter <= hCounter + 1'b1;
      end
    end

  always @(posedge clock, posedge reset) begin 
      if(reset) begin
        vCounter <= 0;
      end else if(refreshVSync) begin
        vCounter <= 0;
      end else begin 
        if(hCounter == 799) begin
          vCounter <= vCounter + 1'b1;
        end else begin 
          vCounter <= vCounter;
        end
      end
    end

  assign hVideoOn = (hCounter < 640);
  assign vVideoOn = (vCounter < 480);
  assign hSync = ((hCounter < 655) || (hCounter > 750));
  assign vSync = ((vCounter < 489) || (vCounter > 490));

  assign refreshHSync = (hCounter == 799);
  assign refreshVSync = ((hCounter == 799) && (vCounter == 524));
  assign vidOn = (hVideoOn && vVideoOn);
 
endmodule