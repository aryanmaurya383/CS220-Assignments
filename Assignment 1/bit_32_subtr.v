`include "full_subtr.v"
module bit_32_subtr(a,b,cout);
    input [31:0] a,b;
    output [31:0] cout;
    wire [32:0] brrOut;
    generate
        genvar i;
        assign brrOut[0]=0;
        for(i=0;i<32;i=i+1) begin
                full_subtr uut(a[i],b[i],brrOut[i],cout[i],brrOut[i+1]);
        end
    endgenerate
endmodule