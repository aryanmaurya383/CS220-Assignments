`timescale 1ns/1ns
`include "Adder32.v"

`define BITS 32

module Adder32_tb;
reg [`BITS-1:0]A;
reg [`BITS-1:0]B;
reg Cin;
wire [`BITS-1:0]S;
wire Cout;

Adder32 uut(.A(A),.B(B),.Cin(Cin),.S(S),.Cout(Cout));

initial begin
    $dumpfile("Adder32_test.vcd");
    $dumpvars(0,Adder32_tb);

    A=1209;B=4656;Cin=0;#20;
    
    $display("Test finished", A,B,S);
end
endmodule