`timescale 1ns / 1ns
`include "T_FF.v"


module mod10counter(q_reg, clk,reset);

parameter W=50_000_000;

output reg [3:0] q_reg;
wire [3:0]q;
input clk, reset;
reg reset_reg;
reg [31:0]one_sec_counter;
initial begin
    reset_reg=1;
    one_sec_counter<=0;
end

always @(posedge clk ) begin
    if(reset_reg)begin
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


T_FF tff0 (q[0],clk,reset_reg);
T_FF tff1(q[1],q[0],reset_reg);
T_FF  tff2 (q[2],q[1], reset_reg);
T_FF tff3 (q[3], q[2], reset_reg);

always@(*)begin
    reset_reg=reset;
end


always@(posedge clk )begin
    reset_reg=reset;

    if(reset_reg==1)begin
        q_reg<=0;
    end
    else begin
        if(one_sec_counter==W)begin 
            q_reg<=q;
            if(q_reg>8)begin
            assign  reset_reg=1;
            end
            else begin
                assign reset_reg=0;
            end
        end
        else begin
            q_reg<=q_reg;
        end
    end
end




endmodule



