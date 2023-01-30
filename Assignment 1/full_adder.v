module full_adder(a,b,cin,cout,crr);
input a,b,cin;
output crr,cout;
wire temp1,temp2,temp3;
xor(cout,a,b,cin);
and(temp1,a,b);
and(temp2,a,cin);
and(temp3,cin,b);
or(crr,temp1,temp2,temp3);
endmodule