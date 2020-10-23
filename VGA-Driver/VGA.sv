module VGA (
    input clk,  // Clock FPGA
    input reset,    //Button
    input swap, //Button
    output vga_hs,
    output vga_vs,
    output logic [7:0] red,
    output logic [7:0] green,
    output logic [7:0] blue,
    output vga_blank_n,
    output clockVGA
    );
    
    logic [9:0] hCounter, vCounter;
    logic [23:0] color;
    
    ClkDivisor VGAClkDivisor(clk,clockVGA);
    
    ControllerSync VGASync(clockVGA,~reset,
        vga_hs,vga_vs,hCounter,vCounter,vga_blank_n);
        
    Application VGAApplication(clk,~reset,~swap,hCounter,vCounter,color);
        
    ControllerPainter VGAPainter(vidOn,~reset,
        color,blue,green,red);
    
endmodule