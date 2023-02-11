`timescale 1ns/1ns
`include "Aditya1.v"
module  test();
reg [3:0]a;
reg clk;
wire [3:0] b,c;

code1 uut(a,clk,b,c);

initial begin
    clk=0;
    forever #10 clk=~clk;
end

initial begin 
    $dumpfile("test.vcd");
    $dumpvars(0,test);
    $monitor(b,c);#10;
    a=4;#20;a=5;#20;
    $finish;
end
endmodule
