`timescale 1s / 1s
`include "mod10counter.v"
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:08:04 01/11/2023
// Design Name:   ripple_carry_counter
// Module Name:   /home/ise/vm_share/Lecture_3_examples/test_ripple_counter.v
// Project Name:  Lecture_3_examples
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ripple_carry_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counter_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	mod10counter uut (
		.clk(clk), 
		.reset(reset),
		.q(q) 
		
	);

	initial begin
	clk<=0;
	forever #1 clk<=~clk;
	end
	
	initial begin
		// Initialize Inputs
		//clk = 0;
        $dumpfile("counter_tb.vcd");
        $dumpvars(0,counter_tb);
$monitor(reset,q);
		reset = 1;

		// Wait 100 ns for global reset to finish
		#20;
       reset = 0; 
		// Add stimulus here
#50
reset=1;
#20;
reset=0;
#20;
#20;

reset=1;
#200;
$finish;
	end
      
endmodule

