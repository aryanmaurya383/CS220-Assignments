`timescale 1ns/1ns
`include "b_bit_adder.v"
// `define B 32;
module b_bit_tb ();
parameter B=4;
reg [B-1:0] a,b;
reg cin;
wire [B-1:0]s_reg;
wire p0_reg,cout_reg;
    b_bit_adder uut(a,b,cin,s_reg,p0_reg,cout_reg);

initial begin
    $dumpfile("b_bit_tb.vcd");
    $dumpvars(0, b_bit_tb);
    
    $monitor(a," ",b," ",cin, " ", s_reg, " ",p0_reg,  " ", cout_reg);
    a=10;b=3;cin=1;#5;
    a=2;b=9;cin=0;#5;
    $display("test completed");
end
endmodule