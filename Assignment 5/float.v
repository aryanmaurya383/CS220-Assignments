`timescale 1ns/1ns
`include "mem1.v"


// module float(clk,match,ans,correct_ans);
module float(clk,match);
input wire clk;
output reg match;
reg [31:0]first,second;
reg [31:0]ans,correct_ans;
wire [31:0] temp1,temp2,temp3;

// mem1 m1(clk,0,1,0,first,0,temp1);
// mem1 m2(clk,0,1,1,second,0,temp2);
// mem1 m3(clk,0,1,2,correct_ans,0,temp3);

reg sign1,sign2;
reg [7:0]exp1,exp2;
reg [24:0] base1,base2,cal_base;

// first stroed at address 0
// second stored at address 1
// correct_ans stored at address 2

initial begin
  first=32'b1_1000_0010_01010000000000000000000;//10.5
// first=32'b0_1000_1111_11011101011011111100110;//122223.8
  second=32'b0_1000_0000_10100000000000000000000;//3.25
// second =32'b0_1000_1001_10011010110101110000101;//1643.36
//   correct_ans=32'b0_1000_0010_10111000000000000000000;//13.75
correct_ans=32'b1_1000_0001_11010000000000000000000;//7.25
// correct_ans=32'b0_1000_1111_11100011110110110010100;//123867.16
end

mem1 m1(clk,1'b0,1'b1,0,first,1'b0,temp1);
mem1 m2(clk,1'b0,1'b1,1,second,1'b0,temp2);
mem1 m3(clk,1'b0,1'b1,2,correct_ans,1'b0,temp3);


always @(posedge clk) begin

  sign1=first[31];
  sign2=second[31];
  exp1=first[30:23];
  exp2=second[30:23];
  base1={2'b01,first[22:0]};
  base2={2'b01,second[22:0]};

if(exp1>exp2)begin
      base2=base2>>exp1-exp2;
      exp2=exp1;
    if(sign1>sign2)begin
          cal_base=base1-base2;
          sign1=1;
          sign2=1;

          while(cal_base[23]!=1)begin
          cal_base=cal_base<<1;
          exp1=exp1-1;
          end
    end
    else if(sign1<sign2)begin
          cal_base=base1-base2;
          sign1=0;
          sign2=0;
          while(cal_base[23]!=1)begin
          cal_base=cal_base<<1;
          exp1=exp1-1;
          end
    end
    else begin
              cal_base=base2+base1;
    end
end

else begin
      base1=base1>>exp2-exp1;
      exp1=exp2;
    
    if(sign1>sign2)begin
          cal_base=base2-base1;
          sign1=0;
          sign2=0;
          while(cal_base[23]!=1)begin
          cal_base=cal_base<<1;
          exp1=exp1-1;
          end
    end
    else if(sign1<sign2)begin
          cal_base=base2-base1;
          sign1=1;
          sign2=1;
          while(cal_base[23]!=1)begin
          cal_base=cal_base<<1;
          exp1=exp1-1;
          end
    end
    else begin
              cal_base=base2+base1;
    end
    
end

if(cal_base[24]==1)begin
      exp1=exp1+1;
      ans[22:0]=cal_base[23:1];
end
else begin
      ans[22:0]=cal_base[22:0];
end

  ans[31]=sign1;
  ans[30:23]=exp1;

  match=correct_ans==ans;

end

endmodule