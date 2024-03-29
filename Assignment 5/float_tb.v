`include "float.v"

module float_tb();
reg clk;
wire [31:0]ans,correct_ans;
wire match;

// float uut(clk,match,ans,correct_ans);
float uut(clk,match);

initial begin
    clk=1;
    forever #10 clk=~clk;
end



initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,float_tb);

    $monitor(match);#30;
    $finish;
end
endmodule