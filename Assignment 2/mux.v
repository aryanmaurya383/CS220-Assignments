module mux(out,a,b,switch);
    input a,b,switch;
    output out;
    wire temp1,temp2;
    and(temp1,a,switch);
    and(temp2,b,~switch);
    or(out,temp1,temp2);
endmodule