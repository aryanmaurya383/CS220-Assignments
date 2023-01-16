module Decoder3to8(A,B,C,Out);
input A,B,C;
output [7:0]Out;

wire negA,negB,negC;
not n1(negA,A);
not n2(negB,B);
not n3(negC,C);
and(Out[0], negA,negB,negC);
and(Out[1], negA,negB,C);
and(Out[2], negA,B,negC);
and(Out[3], negA,B,C);
and(Out[4], A,negB,negC);
and(Out[5], A,negB,C);
and(Out[6], A,B,negC);
and(Out[7], A,B,C);

endmodule