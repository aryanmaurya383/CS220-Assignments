`include "Full_Adder.v"
`define BITS 32

module Adder32(A,B,Cin,S,Cout);
input [`BITS-1:0]A,B;
input  Cin;
output  [`BITS-1:0]S;
output Cout;

wire [`BITS:0]Cout_Temp;
assign Cout_Temp[0]=Cin;
    generate // start of generate block
        genvar i;

    for(  i=0;i<=`BITS-1;i=i+1)begin
        Full_Adder f(.A(A[i]), .B(B[i]), .Cin(Cout_Temp[i]), .S(S[i]), .Cout(Cout_Temp[i+1]));
    end
    assign Cout=Cout_Temp[`BITS];
    endgenerate

endmodule