`timescale 1ns/1ns
`include "T_FF.v"

module T_FF_tb();
reg clk,reset,t;
wire q;

T_FF uut(t,clk,reset,q);

initial begin
  clk=0;
  reset=1;t=0;
  forever #1 clk=~clk;
end

initial begin
  $dumpfile("T_FF_tb.vcd");
  $dumpvars(0,T_FF_tb);
$monitor(reset,t,q);
  reset=1;#5;
  reset=0;t=1;#100;
  // reset=0;t=1;#5;
  // reset=0;t=1;#5;
  // reset=0;t=1;#5;
  // reset=0;t=1;#5;
  // reset=0;t=1;#5;
  $display("test finished");
  $finish;
end
endmodule