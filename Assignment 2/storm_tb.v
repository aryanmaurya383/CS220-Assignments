`timescale 1ns/1ns
`include "stormbreaker.v"
`define MAX 128 

module storm_tb();

parameter B=32;
reg[`MAX-1:0] a,b;
wire [`MAX-1:0]sum;
wire cout,p0;
reg clk;
stormbreaker uut(clk, a,b,sum,p0,cout);

// initial begin
//    clk=0;
//    forever #10 clk=~clk;
// end

initial begin
   clk=0;
   forever #10 clk=~clk;
end


initial begin
    $dumpfile("storm_tb.vcd");
    $dumpvars(0,storm_tb);

    // $monitor(a,b,sum);

    a=7;b=6;#100;
    $display(a,b,sum," ",cout);
    // a=233454;b=125;#100;
    // $display(a,b,sum," ",cout);

    

    a=2;b=1;#100;
    $display(a,b,sum," ",cout);

    a={64{2'b01}};b={64{2'b10}};#100;
    $display(a,b,sum," ",cout);

    a=12;b=125;#100;
    $display(a,b,sum," ",cout);


    $display("test finished");
    $finish;
#100;
end
endmodule
// module storm_tb();
// parameter B=4;
// reg [`MAX-1:0]a,b;
// reg c0;
// wire [`MAX-1:0] s_reg;
// wire cout_reg;

// stormbreaker uut(a,b,c0,s_reg, cout_reg);

// initial begin
//     $dumpfile("storm_tb.vcd");
//     $dumpvars(0, storm_tb);
// $monitor(a, b, s_reg, " ", cout_reg);
//     a=234;b=123;c0=1;#5;
//     a=834;b=243;c0=0;#5;
//     a=123233234;b=132523;c0=0;#5;
//     $display("test finished");
// end
// endmodule