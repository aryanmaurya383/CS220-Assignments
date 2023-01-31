`include "full_adder.v"
module ripple_carry_adder(a,b,c_in,Tsum,Tc_out,clk);
parameter k = 128;
input [k-1:0] a,b;
input c_in,clk;
output reg [k-1:0] Tsum;
output reg Tc_out;
wire [k-1:0] sum;
wire [k:0] win;
assign win[0]=c_in;
genvar i;
generate
    for(i=0;i<k;i=i+1)
    begin: loop1
    full_adder o1(a[i],b[i],win[i],sum[i],win[i+1]);
    end
endgenerate
always@(posedge clk)
begin
    Tsum=sum;
    Tc_out=win[k];
end
endmodule