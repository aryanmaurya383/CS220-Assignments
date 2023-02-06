`timescale 1ns/1ns
`include "full_adder.v"

module b_bit_adder(a,b,cin,kcout,p,sum);
    parameter W = 32;
    input [W-1:0] a,b;
    input cin;
    output kcout;
    output [W-1:0] sum;
    output p;
    wire [W:0] cout;
    wire [W-1:0] moderator;
    wire [W-1:0] moderator_and;
    // initial begin: named1
        // moderator = 1;
        // assign cannot be used inside initial block
    // end
    generate
        genvar i;
        assign cout[0] = cin;
        assign moderator[0] = 1;
        assign moderator_and[0] = 1;
        for(i =0;i<W;i=i+1) begin
            full_adder uut(a[i],b[i],cout[i],sum[i],cout[i+1]);
            xor(moderator[i],a[i],b[i]);
            if(i>0)
            and(moderator_and[i],moderator_and[i-1],moderator[i]);
            // $display(sum[i]);
        end
        assign p = moderator_and[W-1];
        assign kcout = cout[W];
        
    endgenerate
    
    
endmodule