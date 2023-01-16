`timescale 1ns/1ns
`include "Full_Adder.v"

module Full_Adder_tb;
reg A;
reg B;
reg Cin;
wire S;
wire Cout;

Full_Adder uut(A,B,Cin,S, Cout);


initial begin
     $dumpfile("Full_Adder_test.vcd");
     $dumpvars(0,Full_Adder_tb);

    A = 0; B = 0; Cin = 0; #20;
    A = 0; B = 0; Cin = 1; #20;
    A = 0; B = 1; Cin = 0; #20;
    A = 0; B = 1; Cin = 1; #20;
    A = 1; B = 0; Cin = 0; #20;
    A = 1; B = 0; Cin = 1; #20;
    A = 1; B = 1; Cin = 0; #20;
    A = 1; B = 1; Cin = 1; #20;

    $display("Test Complete",A,B,S,Cout);
end

endmodule;
