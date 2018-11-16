module name (
	input clk,    // Clock
	input reset,, swap  // Asynchronous reset active low
	input PS2_CLK, PS2_DATA, LED2,
	output vga_hs,
	output vga_vs,
	output logic [7:0] red,
	output logic [7:0] green,
	output logic [7:0] blue,
	output vga_blank_n,
	output clockVGA
	
);
	logic  clk, reset, LED, KEY_COUNTER;
	logic [31:0] ps2DataInput;
	logic [31:0] playerData, enemyData1, enemyData2;
	
	 

	assign LED = 0;
	assign KEY_COUNTER = 0;

	Keyboard TestingKeyboard (.CLK(clk), .PS2_CLK(PS2_CLK), .PS2_DATA(PS2_DATA), .LED(LED), .LED2(LED2), .KEY_COUNTER(KEY_COUNTER));
	top ArmProcesor(clk, reset, ps2DataInput, playerData, enemyData1, enemyData2);
	VGA VGA(
					clk,  // Clock FPGA
					reset,    //Button
					swap, //Button
					vga_hs,
					vga_vs,
					red,
					green,
					blue,
					vga_blank_n,
					clockVGA
					);

endmodule