module Full_Sub(X,Y,Bin,D,Bout);
input X,Y,Bin;
output D,Bout;

wire xor1, and1, negX, negXor, xor2, and2;

xor x1(xor1,X,Y);
xor (D,xor1,Bin);

//  assign D = a ^ b ^ Bin;
  
  not n1(negX,X);
  and a1(and1,negX,Y);
  xor x2(xor2, X,Y);
  not n2 (negXor, xor2);
  and a2(and2,negXor,Bin);
  or o1 (Bout,and2,and1);
  
//   assign Bout = (~a & b) | (~(a ^ b) & Bin);\
endmodule