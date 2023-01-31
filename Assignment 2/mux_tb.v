`timescale 1ns/1ns
`include "mux2to1.v"

module mux_tb();
reg i0,i1,p0;
wire c0;

mux2to1 uut(i0,i1,p0,c0);

initial begin
    $dumpfile("mux.vcd");
    $dumpvars(0,mux_tb);
    $monitor(c0);
    i0=1;i1=0;
    p0=1;#5
    p0=0;#5;

    $display("test finished");
end
endmodule