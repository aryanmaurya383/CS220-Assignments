`timescale 1ns/1ns
`include "b_bit_new.v"
// `define B 32;
module b_bit_tb ();
parameter B=4;
reg [B-1:0] a,b;
reg cin;
wire [B-1:0]sum;
wire p0,cout;
    b_bit_new uut(a,b,cin,sum,p0,cout);

initial begin
    $dumpfile("b_new_tb.vcd");
    $dumpvars(0, b_bit_tb);
    
    $monitor(a," ",b," ",cin, " ", sum, " ",p0,  " ", cout);
    a=10;b=3;cin=1;#5;
    a=2;b=9;cin=0;#5;
    $display("test completed");
end
endmodule