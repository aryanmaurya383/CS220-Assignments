`timescale 1ns/1ns
`include "bit_32_subtr.v"
module bit_32_subtr_tb;
    reg [31:0] a,b;
    wire [31:0] cout;
    bit_32_subtr uut(a,b,cout);
    initial begin
        $dumpfile("bit_32_subtr.vcd");
        $dumpvars(0,bit_32_subtr_tb);
        $monitor(a," ",b," ",cout);
        a=52;b=32;
        #5;
        a=53;b=45;
        #5;
        a=41;b=41;
        #5;
        $display("Task completed");
    end
endmodule