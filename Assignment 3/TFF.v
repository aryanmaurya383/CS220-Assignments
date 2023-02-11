`timescale 1ns / 1ps
`include "DFF.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:25 01/11/2023 
// Design Name: 
// Module Name:    TFF 
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
module TFF(q,clk,reset);

output q;
input clk, reset;
wire d;

DFF dff_0 (q,d,clk,reset);
not n1(d,q);

endmodule
