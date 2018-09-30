module StateMachine(
	input logic clk,    // Clock
	input logic swap,   // Enable
	input logic reset,  //reset
	output logic [2:0] y);
	

	typedef enum logic [2:0] {s0, s1, s2, s3} statetype;
	statetype state = s0, nextstate;
	

	//state register
	always_ff @(posedge clk, posedge reset)
			if (reset) state <= s0;
			else if(swap) state <= nextstate;

		
	//next state logic
	always_comb
		case(state)
			s0: nextstate =s1;
			s1: nextstate =s2;
			s2: nextstate =s3;
			s3: nextstate =s0;
			default: nextstate =s0;
		endcase // state

	//output
	assign y = state;

endmodule