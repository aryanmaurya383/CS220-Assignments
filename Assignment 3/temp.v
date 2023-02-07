`include "T_FF.v"
`timescale 1ns/1ns

module temp();
wire [3:0] q_wire;
reg reset;
reg clk;
initial begin
    clk=0;
    forever #1 clk=~clk;
end

initial begin
    reset=1;#10;reset=0;#20;$finish;

end

always @(posedge clk) begin
    $display(q_wire[0]);
end

T_FF tff4(1'b1, clk,reset,q_wire[0]);

endmodule