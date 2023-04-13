// Code by Maurya Aryan 210595 and Depanshu Sahu 210316
`include "decide_file.v"

module tb();
reg clk;

decide_file uut(clk);

initial begin
    clk=1;
    forever #1 clk=~clk;
end

initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #2000;
    
    $finish;
end
endmodule