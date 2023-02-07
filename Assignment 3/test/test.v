`include "TOP.v"

module test();
reg CLK,reset;
wire[3:0] OUT;

TOP uut (CLK,reset,OUT);

initial begin
    CLK=0;
    forever #1 CLK=~CLK;
end



initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test);
    $monitor(reset,OUT);
    reset=1;
    #40;
    reset=0;
    #100;
     reset=1;
    #40;
    reset=0;
    #40;
    reset=1;
    #40;
    $display("test completed");
    $finish;

end
endmodule