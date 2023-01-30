`timescale 1ns/1ns
`include "bit_32_adder.v"

module bit_32_adder_tb;
    reg [31:0] a,b;
    wire [31:0] cout,crr;
    bit_32_adder uut(a,b,cout);
    initial begin
        $dumpfile("bit_32_adder.vcd");
        $dumpvars(0,bit_32_adder_tb);
        $monitor(a," ",b," ",cout);
        a=2345;
        b=12; 
               #5;
        a=502;
        b=23;
        #5;
        a={16{2'b10}};
        b={16{2'b10}};
        #5;
        a={16{2'b00}};
        b={16{2'b10}};
        #5;
        $display("test completed");
    end



endmodule