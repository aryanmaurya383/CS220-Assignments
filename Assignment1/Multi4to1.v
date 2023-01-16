`define BITS 32

module Multi4to1(I0,I1,I2,I3,S0,S1,Out);
input  [`BITS-1:0] I0,I1,I2,I3;
input wire S0,S1;
output reg [`BITS-1:0] Out;
wire [1:0] Sin;
assign Sin[0]=S1;
assign Sin[1]=S0;

always @(*) begin
    
if(Sin==0)begin
    assign Out=I0;
end
else if (Sin==1)begin
    assign Out=I1;
end
else if (Sin==2)begin
    assign Out=I2;
end
else begin
    assign Out=I3;

end
end
endmodule