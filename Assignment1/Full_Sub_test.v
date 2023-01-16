`timescale 1ns/1ns
`include "Full_Sub.v"



module Full_Sub_tb;
reg X;
reg Y;
reg Bin;
wire D;
wire Bout;

Full_Sub uut(X,Y,Bin,D,Bout);

initial begin
    $dumpfile("Full_Sub_test.vcd");
    $dumpvars(0,Full_Sub_tb);

    X = 0; Y = 0; Bin = 0; #20;
    X = 0; Y = 0; Bin = 1; #20;
    X = 0; Y = 1; Bin = 0; #20;
    X = 0; Y = 1; Bin = 1; #20;
    X = 1; Y = 0; Bin = 0; #20;
    X = 1; Y = 0; Bin = 1; #20;
    X = 1; Y = 1; Bin = 0; #20;
    X = 1; Y = 1; Bin = 1; #20;

    $display("Test Complete");
end

endmodule