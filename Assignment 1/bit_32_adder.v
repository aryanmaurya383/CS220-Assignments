`timescale 1ns / 1ps
`include "full_adder.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:57:23 01/15/2023 
// Design Name: 
// Module Name:    full_adder_32 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module bit_32_adder(a,b,cout);
    input [31:0] a,b;
    output [31:0] cout;
    wire [32:0] crr;
    wire [31:0] temp1,temp2,temp3;
	 generate
        genvar i;
    for(i=0;i<32;i=i+1)begin : temp
        if(i>0)begin
		  full_adder uut(a[i],b[i],crr[i],cout[i],crr[i+1]);
        end
        else 
        begin
            assign crr[0]=0;
            full_adder uut(a[i],b[i],crr[0],cout[i],crr[i+1]);
				 end

    end
    endgenerate

endmodule
