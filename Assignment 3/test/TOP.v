`include "T_FF.v"
`include "NINE_YET.v"
module TOP (CLK,reset,OUT_reg);
  input CLK;
  input reset;
  output reg [3:0] OUT_reg;
  wire [3:0] OUT;
  wire [1:0]nine_yet_op;
  NINE_YET m(OUT,nine_yet_op,reset);


always@(posedge CLK || reset)begin
    if(reset)begin
        OUT_reg<=0;
        
    end
    else begin
        OUT_reg<=OUT;
    end
end

  TFF Q0(CLK,1'b1,OUT[0],reset);
  TFF Q1(nine_yet_op[0],1'b1,OUT[1],reset);
  TFF Q2(~OUT[1],1'b1,OUT[2],reset);
  TFF Q3(nine_yet_op[1],1'b1,OUT[3],reset);
endmodule // TOP