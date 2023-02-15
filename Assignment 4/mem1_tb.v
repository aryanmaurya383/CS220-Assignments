`timescale 1ns/1ns
`include "mem1.v"

module mem1_tb();
reg clk,rst,w_en,mode;
reg [4:0] address,data_in;
wire [4:0]data_out;

mem1 uut(clk,rst,w_en,address,data_in,mode,data_out);

initial begin
    clk=1;
    forever #10 clk=~clk;
end

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,mem1_tb);
$monitor(rst,mode,w_en,address,data_in,data_out);
    rst=1;w_en=0;address=0;data_in=0;mode=0;#20;

    rst=0;mode=0;w_en=1;address=5;data_in=27;#20;
    rst=0;mode=0;w_en=1;address=8;data_in=26;#20;
    rst=0;mode=0;w_en=1;address=23;data_in=25;#20;
    rst=0;mode=1;w_en=1;address=8;data_in=27;#20;
    rst=0;mode=1;w_en=1;address=5;data_in=27;#20;
    rst=0;mode=1;w_en=1;address=23;data_in=27;#20;
    $display("test finished");
    $finish;
end
endmodule
