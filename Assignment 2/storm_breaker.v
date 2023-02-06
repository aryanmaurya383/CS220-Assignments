`timescale 1ns/1ns
`include "b_bit_adder.v"
`include "mux.v"

module storm_breaker(clk,a,b,c0,sum,cout,p0);

    parameter W =32;
    parameter MaxBit = 128;

    input [MaxBit-1:0] a,b;
    input c0;
    input clk;
    output reg[MaxBit-1:0] sum;
    output reg cout;
    output reg p0;
	 
    reg reg_a,reg_b;
    wire [MaxBit-1:0] sum_wire;
    wire cout_wire;
    wire p0_wire;
	 wire [MaxBit/W:0] p0_mid_wire;
    wire [MaxBit:0] crr_temp;
	 
	 always @(posedge clk) begin
        reg_a <= a;
        reg_b <= b;
        sum <= sum_wire;
        p0 <= p0_wire; 
        cout <=cout_wire;
    end
	 
	 generate
        assign crr_temp[0] = c0;
        genvar i;
        for(i=0;i<MaxBit;i= i+W) begin: named2 
            b_bit_adder uut(a[i+W-1:i],b[i+W-1:i],crr_temp[i],crr_temp[i+W-1],p0_mid_wire[i/W],sum_wire[i+W-1:i]);
            mux uut2(crr_temp[i+W],crr_temp[i],crr_temp[i+W-1],p0_mid_wire[i/W]);
        end
            assign cout_wire = crr_temp[MaxBit];
				assign p0_wire = p0_mid_wire[MaxBit/W - 1];
        
    endgenerate
endmodule
	 