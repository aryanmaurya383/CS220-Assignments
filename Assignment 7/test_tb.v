`include "decide_file.v"

module tb();
reg clk;
// wire [31:0]registers32;

decide_file uut(clk);
// decide_file uut(clk, registers32);

initial begin
    clk=1;
    forever #1 clk=~clk;
end

initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #50;
    
    $finish;
end
endmodule