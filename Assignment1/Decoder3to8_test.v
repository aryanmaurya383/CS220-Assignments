`include "Decoder3to8.v"

module Decoder3to8_tb;
reg A,B,C;
wire [7:0]Out;

Decoder3to8 uut(A,B,C,Out);

initial begin
    $dumpfile("Decoder3to8_test.vcd");
    $dumpvars(0,Decoder3to8_tb);

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