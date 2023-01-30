`timescale 1ns/1ns
`include "op_de.v"


module op_de_tb;
reg A,B,C;
wire [7:0]Out;

op_de uut(A,B,C,Out);

initial begin
    $dumpfile("op_de_tb.vcd");
    $dumpvars(0,op_de_tb);

    $monitor(A,B,C,Out);
    A = 0; B = 0; C = 0; #20;
    A = 0; B = 0; C = 1; #20;
    A = 0; B = 1; C = 0; #20;
    A = 0; B = 1; C = 1; #20;
    A = 1; B = 0; C = 0; #20;
    A = 1; B = 0; C = 1; #20;
    A = 1; B = 1; C = 0; #20;
    A = 1; B = 1; C = 1; #20;
$display("Test Complete");
end
endmodule
