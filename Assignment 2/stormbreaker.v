`timescale 1ns/1ns
`include "b_bit_new.v"
`include "mux2to1.v"
`define MAX 128

module stormbreaker(a,b,sum,p0,cout);
parameter B=4;
input [`MAX-1:0]a,b;
output reg[`MAX-1:0]sum;
output reg p0,cout;

reg [`MAX-1:0]a_reg,b_reg;
wire [`MAX-1:0]sum_wire;
wire p0_wire,cout_wire;
wire crr_temp[`MAX:0];
reg crr_reg[`MAX:0];

always @(*) begin:alw1
    a_reg<=a;
    b_reg<=b;
    sum<=sum_wire;
    p0<=p0_wire;
    cout<=cout_wire;
    // crr_reg<=crr_temp;
end
wire temp;
assign crr_temp[0]=0;
generate
     genvar i;
     for(i=0;i!=`MAX;i=i+B) begin:for1
        b_bit_new b1(a_reg[i+B-1:i],b_reg[i+B-1:i],crr_temp[i],sum_wire[i+B-1:i], p0_wire, crr_temp[i+B]);
        mux2to1 m1(crr_temp[i], crr_temp[i+B],p0_wire,crr_temp[i+B]);
        // $monitor(crr_temp[i]);
        assign crr_temp[i+B]=temp;
        assign cout_wire=crr_temp[i+B];
     end
     endgenerate

endmodule









// module stormbreaker(a,b,c0,s_reg,cout_reg);
// parameter B=4;
// input  [`MAX-1:0]a,b;
// input  c0;
// output reg[`MAX-1:0]s_reg;
// output reg cout_reg;
// reg c0_reg;
// reg [`MAX-1:0]a_reg,b_reg;
// wire [`MAX-1:0] s;
// wire [`MAX:0]ctemp,ptemp;
// wire cout_temp;


// always @(*)begin: alw1
//     a_reg<=a;
//     b_reg<=b;
//     c0_reg=c0;
//     s_reg<=s;
//     cout_reg<=cout_temp;
// end

// assign ctemp[0]=c0_reg;

// generate
//     genvar i;
//     for(i=0;i!=`MAX;i=i+B) begin:temp
//     b_bit_new b1(a_reg[i+B-1:i], b_reg[i+B-1:i], ctemp[i], s[i+B-1:i], ptemp[i], ctemp[i+B] );
//     mux2to1 m1(ctemp[i], ctemp[i+B], ptemp[i], ctemp[i+B]);
//     end
//     endgenerate

//     always @(*) begin:alw2
//         s_reg<=s;
//         cout_reg<=ctemp[`MAX];
//     end
// endmodule
