`timescale 1ns / 1ns
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
	wire [3:0] q_reg;

	// Instantiate the Unit Under Test (UUT)
	mod10counter uut (
		.q_reg(q_reg), 
		.clk(clk), 
		.reset(reset)
		
	);

	initial begin
	clk<=0;
	forever #10 clk<=~clk;
	end
	
	initial begin
		// Initialize Inputs
		//clk = 0;
        $dumpfile("counter_tb.vcd");
        $dumpvars(0,counter_tb);
$monitor(reset,q_reg);
		reset = 1;

		// Wait 100 ns for global reset to finish
		#10;
       reset = 0; 
		// Add stimulus here
#500
reset=1;
#100;
reset=0;
#100;
$finish;
	end
      
endmodule

