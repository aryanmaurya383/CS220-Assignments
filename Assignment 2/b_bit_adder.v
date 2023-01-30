`timescale 1ns/1ns
// `define B 32
`define MAX 128 

module b_bit_adder(a,b,cin,s_reg,p0_reg,cout_reg);

parameter B =32;
input  [B-1:0] a,b;
input  cin;
output reg [B-1:0]s_reg;
output reg p0_reg,cout_reg;
wire [B:0] ctemp;
reg [B-1:0]a_reg,b_reg;
reg cin_reg;
wire [B-1:0] s,xorarr,andxor;
wire p0;
assign ctemp[0]=cin;
assign p0=1;
xor(andxor[0], a[0], b[0]);

generate
    genvar i;
    for(i=0;i<B;i=i+1)
    begin: tempfor
    wire temp1,temp2,temp3,temp4;
    xor(s[i],a[i],b[i],ctemp[i]);
    and(temp1,a[i],b[i]);
    and(temp2,a[i],ctemp[i]);
    and(temp3,ctemp[i],b[i]);
    or(ctemp[i+1],temp1,temp2,temp3);
    xor(xorarr[i], a[i],b[i]);
    if(i>1)begin
    and(andxor[i], andxor[i-1], xorarr[i]);
    end
    end

always @(*) begin
    a_reg<=a;
    b_reg<=b;
    cin_reg<=cin;
    s_reg<=s;
    cout_reg<=ctemp[B];
    p0_reg<=andxor[B-1];
end

endgenerate
endmodule