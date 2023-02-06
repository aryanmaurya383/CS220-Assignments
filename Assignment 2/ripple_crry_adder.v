`timescale 1ns/1ns
`include "full_adder.v"

module ripple_crry_adder(clk,a,b,cin,cout,sum);
    parameter MaxSize = 128;
    input [MaxSize-1:0] a,b;
    input cin;
    input clk;
    output reg cout;
    output reg [MaxSize-1:0]sum;
    wire [MaxSize:0] temp;
    wire temp_cout;
    wire [MaxSize-1:0] temp_sum;
    always @(posedge clk) begin
        sum <= temp_sum;
        cout <= temp_cout;
    end
    generate
        genvar i;
        assign temp[0] = cin;
        for(i = 0;i<MaxSize;i= i+1 ) begin: named1
            full_adder uut(a[i],b[i],temp[i],temp_sum[i],temp[i+1]);
        end
        assign temp_cout = temp[MaxSize];
    endgenerate

endmodule