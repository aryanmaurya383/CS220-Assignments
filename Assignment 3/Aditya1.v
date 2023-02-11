module code1 (a , clk , b , c );
input [3:0] a ;
input clk ;
output reg [3:0] b , c ;
always @ (posedge clk )
begin
c <= b ;
b = a ;
end
endmodule
