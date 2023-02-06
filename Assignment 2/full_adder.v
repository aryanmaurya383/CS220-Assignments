module full_adder(a,b,cin,sum,cout);
    input a,b,cin;
    output cout,sum;
    wire temp1,temp2,temp3;
    xor(sum,a,b,cin);
    and(temp1,a,cin);
    and(temp2,b,cin);
    and(temp3,a,b);
    or(cout,temp1,temp2,temp3);
    
endmodule