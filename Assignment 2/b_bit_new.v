module b_bit_new(a,b, cin,sum,p0,cout);
parameter B=4;

input [B-1:0] a,b;
input cin;
output p0;
output [B-1:0] sum;
output cout;
wire [B-1:0] xorarr,andxor;


assign {cout,sum}=a+b+cin;

generate
    genvar i;
    for(i=0;i<B;i=i+1)begin: for1
    xor(xorarr[i], a[i],b[i]);
    if(i>1)begin
    and(andxor[i], andxor[i-1], xorarr[i]);
    end
    end
endgenerate

assign p0=andxor[B-1];

endmodule