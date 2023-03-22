`include "test.v"

module tb();
reg [3:0]a ,b;
reg clk,reset;
wire [3:0]out;

test uut(clk,reset,a,b,out);

initial begin
    clk=1;
forever #10 clk=~clk;
end

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, tb);

reset=1;#10;
reset=0;#10;
    $monitor(a,b,out);
    a=1;b=10;#20;
    a=2;b=10;#20;
    a=3;b=10;#20;
    a=4;b=10;#20;
    a=5;b=10;#20;
    a=6;b=10;#20;
    a=7;b=10;#20;
    a=8;b=10;#20;
    a=9;b=10;#60;
    $finish;
end
endmodule