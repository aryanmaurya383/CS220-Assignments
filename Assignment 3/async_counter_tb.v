

`timescale 1ns / 1ps
`include "async_counter.v"

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

module async_counter_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	ripple_carry_counter uut (
		.q(q), 
		.clk(clk), 
		.reset(reset)
		
	);

	initial begin
	clk<=0;
	forever #10 clk<=~clk;
	end
	
	initial begin
        $dumpfile("async_counter_tb.vcd");
        $dumpvars(0,async_counter_tb);
        $monitor(q);
		// Initialize Inputs
		//clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
       reset = 0; #2000;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
       reset = 0; #2000;
       $finish;
		// Add stimulus here

	end
      
endmodule


