`timescale 1ns/1ns
`include "Sub32.v"
`define BITS 32

module Sub32_tb;
reg [`BITS-1:0]X;
reg [`BITS-1:0]Y;
reg Bin;
wire [`BITS-1:0]D;
wire Bout;

Sub32 uut(.X(X),.Y(Y),.Bin(Bin),.D(D),.Bout(Bout));

initial begin
    $dumpfile("Sub32_test.vcd");
    $dumpvars(0,Sub32_tb);

    X=1200;Y=300;Bin=0;#20;
    
    $display("Test finished", X,Y,D);
end
endmodule