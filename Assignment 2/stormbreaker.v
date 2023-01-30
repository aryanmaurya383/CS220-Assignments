`timescale 1ns/1ns
`include "b_bit_adder.v"
`include "mux2to1.v"
`define MAX 128

module stormbreaker(a,b,c0,s_reg,cout_reg);
parameter B=32;
input  [`MAX-1:0]a,b;
input  c0;
output reg[`MAX-1:0]s_reg;
output reg cout_reg;
reg c0_reg;
reg [`MAX-1:0]a_reg,b_reg;
wire [`MAX-1:0] s;
wire [`MAX:0]ctemp,ptemp;


always @(*)begin: alw1
    a_reg<=a;
    b_reg<=b;
    c0_reg=c0;
end
assign ctemp[0]=c0_reg;

generate
    genvar i;
    for(i=0;i!=`MAX;i=i+B) begin:temp
    b_bit_adder b1(a_reg[i+B-1:i], b_reg[i+B-1:i], ctemp[i], s[i+B-1:i], ptemp[i], ctemp[i+B] );
    mux2to1 m1(ctemp[i], ctemp[i+B], ptemp[i], ctemp[i+B]);
    end
    endgenerate

    always @(*) begin:alw2
        s_reg<=s;
        cout_reg<=ctemp[`MAX];
    end
endmodule
