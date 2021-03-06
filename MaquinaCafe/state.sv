module state (
	input logic clk,    // Clock
	input logic enable, // Enable
	output logic [2:0] y);
	

	typedef enum logic [2:0] {s0, s1, s2, s3, s4} statetype;
	statetype state = s0, nextstate;
	

	//state register
	always_ff @(posedge clk)
			if(enable==1) state <= nextstate;
		

	//next state logic
	always_comb
		case(state)
			s0: nextstate =s1;
			s1: nextstate =s2;
			s2: nextstate =s3;
			s3: nextstate =s4;
			s4: nextstate =s0;
			default: nextstate =s0;
		endcase // state

	//output
	assign y = state;

endmodule