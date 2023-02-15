`timescale 1ns/1ns
`include "mem2.v"

module mem1_tb();
reg clk,rst,w_en,mode;
reg [4:0] address_a,address_b,data_in;
wire [4:0]data_out;

mem2 uut(clk,rst,w_en,address_a,address_b,data_in,mode,data_out);

initial begin
    clk=1;
    forever #10 clk=~clk;
end

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,mem1_tb);
$monitor(rst,mode,w_en,address_a,address_b,data_in,data_out);

    // rst=0;mode=0;w_en=1;address_a=5;address_b=8;data_in=27;#20;
    // rst=0;mode=0;w_en=1;address_a=8;address_b=23;data_in=26;#20;
    // rst=0;mode=0;w_en=1;address_a=23;address_b=5;data_in=25;#20;
    // rst=0;mode=1;w_en=1;address_b=8;address_b=8;data_in=27;#20;
    rst=1;w_en=0;address_a=0;address_b=0;data_in=0;mode=0;#20;

    rst=0;mode=0;w_en=1;address_a=5; address_b=0;data_in=27;#20;
    rst=0;mode=0;w_en=1;address_a=8; address_b=5;data_in=26;#20;
    rst=0;mode=0;w_en=1;address_a=23; address_b=8;data_in=25;#20;
    rst=0;mode=1;w_en=1;address_a=8; address_b=23;data_in=27;#20;
    rst=0;mode=1;w_en=1;address_a=5; address_b=8;data_in=27;#20;
    rst=0;mode=1;w_en=1;address_a=20; address_b=23;data_in=27;#20;#20;
    $display("test finished");
    $finish;
end
endmodule
