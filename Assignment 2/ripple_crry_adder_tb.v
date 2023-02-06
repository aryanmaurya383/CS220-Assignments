`timescale 1ns/1ns
`include "ripple_crry_adder.v"

module ripple_crry_adder_tb;
    parameter MaxSize = 128;
    reg [MaxSize-1:0] a,b;
    reg cin;
    wire cout;
    wire[MaxSize-1:0] sum;
    reg clk;
    ripple_crry_adder uut(clk,a,b,cin,cout,sum);
    initial begin
        clk = 0;
      forever #10 clk = ~clk;
    end
    initial begin
        $dumpfile("ripple_crry_adder.vcd");
        $dumpvars(0,ripple_crry_adder_tb);
        $monitor(a," ",b," ",cin," ",cout," ",sum);
        a = {64{2'b01}};b={64{2'b10}};cin = 0;#22;
        a = {64{2'b01}};b={64{2'b01}};cin = 0;#22;
        a = {32{4'b0001}};b={32{4'b0001}};cin = 0;#22;
        a = 2134;b=2345;cin = 0;#22;
        a = 2134;b=4349;cin = 0;#22;
        a = 2138;b=2346;cin = 0;#22;
        $finish;
    end
endmodule