`include "Multi4to1.v"
`define BITS 32

module Multi4to1_tb;
reg [`BITS-1:0] I0,I1,I2,I3;
reg S0,S1;
wire [`BITS-1:0] Out;

Multi4to1 uut(I0,I1,I2,I3,S0,S1,Out);

initial begin
    $dumpfile("Multi4to1_test.vcd");
    $dumpvars(0,Multi4to1_tb);

    I0=20;I1=21;I2=22;I3=23;
    $monitor(I0," ",I1," ",I2," ",I3," ",S0," ",S1," ",Out);
    S0=0;S1=0;#20;
    S0=0;S1=1;#20;
    S0=1;S1=0;#20;
    S0=1;S1=1;#20;
    
end
endmodule