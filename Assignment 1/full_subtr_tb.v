`timescale 1ns/1ns
`define one 1'b1;
`define zero 1'b0;
module full_subtr_tb;
reg a,b,cin;
wire cout,brr;
full_subtr uut(a,b,cin,cout,brr);
initial begin
    $dumpfile("full_subtr.vcd");
    $dumpvars(0,full_subtr_tb);
  $monitor(a,b,cin,cout,brr);
  a=`one;b=`zero;cin=`zero;
  #5;
  a=`one;b=`zero;cin=`one;
  #5;
  a=`one;b=`one;cin=`zero;
  #5;
  $display("test completed");
end
endmodule