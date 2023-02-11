`timescale 1ns / 1ps

`include "TFF.v"

module ripple_carry_counter(q, clk,reset);

// parameter W=50_000_000;
parameter W=10;


output [3:0] q;
input clk, reset;
wire reset_wire;
or(reset_wire,reset,q[3]&q[1]);

reg [31:0] one_sec_counter;

always @(posedge (clk) or posedge(reset)) begin: temp1
    if(reset)begin
        one_sec_counter=32'b0;
    end
    else begin
        if(one_sec_counter==W)begin
            one_sec_counter=32'b0;
        end
        else begin 
            one_sec_counter=one_sec_counter+1;
        end
    end
end

reg custom ;
always @(*) begin
    custom = one_sec_counter==W;
end


TFF tff0 (q[0],custom,reset_wire);
TFF tff1(q[1],q[0],reset_wire);
TFF  tff2 (q[2],q[1], reset_wire);
TFF tff3 (q[3], q[2], reset_wire);




endmodule
