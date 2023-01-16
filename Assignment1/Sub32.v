`include "Full_Sub.v"
`define BITS 32

module Sub32(X,Y,Bin,D,Bout);
input [`BITS-1:0]X,Y;
input  Bin;
output  [`BITS-1:0]D;
output Bout;

wire [`BITS:0]Bout_Temp;
assign Bout_Temp[0]=Bin;
    generate // start of generate block
        genvar i;

    for(  i=0;i<=`BITS-1;i=i+1)begin
        Full_Sub f(.X(X[i]), .Y(Y[i]), .Bin(Bout_Temp[i]), .D(D[i]), .Bout(Bout_Temp[i+1]));
    end
    
    assign Bout=Bout_Temp[`BITS];
    endgenerate

endmodule