module full_subtr(a,b,cin,cout,brr);
    input a,b,cin;
    output cout,brr;
    wire temp1,temp2,temp3,neg_a;
    not(neg_a,a);
    xor(cout,a,b,cin);
    //cout (cin.a.b)|(a.~b)
    and(temp1,cin,b);
    and(temp2,neg_a,b);
    and(temp3,neg_a,cin);
    or(brr,temp1,temp2,temp3);

endmodule