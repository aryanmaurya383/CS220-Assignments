`include "mod10counter.v"
`timescale 1ms/1ms

module counter_tb ();
reg clk,reset;
wire [3:0]q;

mod10counter uut(clk,reset,q);

initial begin
    clk=0;
    forever #1 clk=~clk;
end

initial begin
    $dumpfile("counter_tb.vcd");
    $dumpvars(0,counter_tb);
    $monitor(reset,q);
    reset =0;#120;
    reset=1;#10;
    $display("test finished");
    $finish;

end
endmodule