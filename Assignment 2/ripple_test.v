`include "ripple_carry_adder.v"
module test_Ripple;
reg [127:0]a,b;
wire [127:0]sum;
wire cout;
reg c_in,clock;
ripple_carry_adder #(.k(128)) uut(.a(a),.b(b),.c_in(c_in),.Tsum(sum),.Tc_out(cout),.clk(clock));

initial begin
   clock=0;
   forever #10 clock=~clock;
end

initial
begin
   a=12;b=23;
   c_in=1;
   #100
   $display(sum);
   $display(cout); 
   $finish;
end
endmodule