module full_adder(a,b,c_in,sum,c_out);
input a,b,c_in;
output sum,c_out;
wire f,g,h,i;
xor(f,a,b);
xor(sum,f,c_in);
and(g,f,c_in);
and(h,a,b);
or(c_out,g,h);
endmodule