module Full_Adder(A,B,Cin, S,Cout);
input A,B, Cin;
output  S,Cout;

wire and1,and2,and3,or1,xor1;
 
xor x1(xor1, A,B);
xor x2(S,xor1,Cin);

and a1(and1, A,B);
and a2(and2, Cin,B);
and a3(and3, A,Cin);
or o1(or1,and1,and2);
or o2(Cout,or1,and3);

endmodule