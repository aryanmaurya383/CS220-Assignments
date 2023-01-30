`timescale 1ns/1ns
`include "mux.v"
module mux_tb;
    reg [31:0]cin1,cin2,cin3,cin4;
    reg switch1,switch2;
    wire [31:0]cout;
    mux uut(cin1,cin2,cin3,cin4,switch1,switch2,cout);
    initial begin
        $dumpfile("mux.vcd");
        $dumpvars(0,mux_tb);
        $monitor(cin1," ",cin2," ",cin3," ",cin4," ",switch1," ",switch2," ",cout);
        cin1=12;cin2=13;cin3=14;cin4=15;
        switch1=0;switch2=0;#20;
    switch1=0;switch2=1;#20;
    switch1=1;switch2=0;#20;
    switch1=1;switch2=1;#20;
        $display("Test completed");
    end
endmodule