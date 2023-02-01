`timescale 1ns/1ns

module mux2to1(i0,i1,p0,c0);
input wire i0,i1,p0;
output c0;
assign c0 = (((~p0)&i0 )| (p0&i1));

endmodule;

// module mux2to1(i0,i1,p0,c0);

//     input wire i0,i1,p0;
//     output reg c0;
//     reg i0_reg,i1_reg;
//     wire c0_wire;
//     wire negp0,and1,and2;

//     always @(*) begin: alw1
//     i0_reg<=i0;
//     i1_reg<=i1;
//     end

//     not(negp0,p0);
//     and(and1,negp0,i0_reg);
//     and(and2,p0,i1_reg);
//     or(c0_wire, and1,and2);
    
//     always @(*) begin: alw2
//     c0<=c0_wire;
//     end

// endmodule    
