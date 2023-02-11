`include "seq_det.v"

module seq_det_tb;
    reg reset,clk,req1;
    wire gnt1;

    seq_det uut(clk,reset,req1,gnt1);
    always #5 clk =~clk;
    initial begin
        $dumpfile("seq_det.vcd");
        $dumpvars(0,seq_det_tb);
        $monitor(req1," ",gnt1);
        clk = 1;reset = 1'b1;req1=1'b0;
        #10;reset=1'b0;
        req1=1'b1;#10;
        req1=1'b0;#10;
        req1=1'b1;#10;
        req1=1'b0;#10;
        req1=1'b1;#10;
        req1=1'b0;#10;
        req1=1'b1;#10;
        req1=1'b0;#10;
        req1=1'b1;#10;
        req1=1'b0;#10;
        req1=1'b1;#10;
        req1=1'b0;#10;
        req1=1'b1;#10;
        req1=1'b1;#10;
        $finish;
    end
endmodule