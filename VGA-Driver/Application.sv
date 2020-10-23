module Application (
	input clk_in,    // Clock input
	input reset_in, // reset input
	input swap_in,  // user input
	input logic [9:0] horizontal, //horizontal value
	input logic [9:0] vertical, //vertical value
	output logic [23:0] color
);


//negates inputs
//logic clk = !clk_in;
//logic reset = !reset_in;
//logic swap = !swap_in;

//wires used
logic [23:0] colorReg1;
logic [23:0] colorReg2;
logic [23:0] colorReg3;
logic [23:0] colorReg4;

///loading and generating colors
logic [1:0] machineState;
logic [3:0] clockColor;
logic [23:0] newColor;

///selected color to paint
logic [1:0] zone;

//generating and storing colors
Counter colorgen(clk_in, reset_in, newColor);

//machine state, chooses which color to store
StateMachine machine(clk_in, swap_in, reset_in, machineState);
Deco2a4 deco(machineState, clockColor);

//storing colors
ParalelRegister  #(24) color1(newColor, clockColor[0], colorReg1);
ParalelRegister  #(24) color2(newColor, clockColor[1], colorReg2);
ParalelRegister  #(24) color3(newColor, clockColor[2], colorReg3);
ParalelRegister  #(24) color4(newColor, clockColor[3], colorReg4);

//choosing the color to paint
SelectionZone select(horizontal , vertical, reset_in, zone);
Multiplexer mux24b(colorReg1, colorReg2, colorReg3, colorReg4, zone, reset, color);

endmodule