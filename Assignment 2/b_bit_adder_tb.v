`timescale 1ns/1ns
`include "b_bit_adder.v"

module b_bit_adder_tb;
    parameter W = 8;
    reg [W-1:0] a,b;
    reg cin;
    wire p;
    wire [W-1:0] sum;
    wire  kcout;
    wire [3:0] size = 8;
    b_bit_adder uut(a,b,cin,kcout,p,sum);
    initial begin
      $dumpfile("b_bit_adder.vcd");
      $dumpvars(0,b_bit_adder_tb);
      $monitor("inputs-",a," ",b," ",cin," ",kcout," sum-",sum," ",p);
      a = 23;b=45;cin=1;#5;
      a=45;b= 23;cin=0;#5;
      a =34;b=23;cin=0;#5;
      a =34;b=23;cin=1;#5;
      a =34;b=24;cin=0;#5;
      a = 0 ;b={8{1'b1}};#5;
      a =8'b10000000;b=8'b10000000;cin=0;#5;
      $finish;
    end
endmodule