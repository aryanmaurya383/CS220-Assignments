module op_de(A,B,C,Out);
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

// module op_de(cin1,cin2,cin3,cout1,cout2,cout3,cout4,cout5,cout6,cou7,cout8);
//     input cin1,cin2,cin3;
//     output cout1,cout2,cout3,cout4,cout5,cout6,cou7,cout8;
//     wire negcin1,negcin2,negcin3;
//     generate
//         not(negcin1,cin1);
//         not(negcin2,cin2);
//         not(negcin3,cin3);
//         and(cout8,negcin3,cin1,cin2);
//         and(cout1,cin3,negcin1,cin2);
//         and(cout2,cin3,cin1,negcin2);
//         and(cout3,negcin3,negcin1,negcin2);
//         and(cout4,negcin3,negcin1,cin2);
//         and(cout5,negcin3,cin1,negcin2);
//         and(cout6,cin3,negcin1,negcin2);
//         and(cout7,cin3,cin1,cin2);
//     endgenerate
// endmodule