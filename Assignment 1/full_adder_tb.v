`define one 1'b1;
`define zero 1'b0;
module full_adder_tb;
    reg a,b,cin;
    wire cout,crr;
    full_adder my_adder(a,b,cin,cout,crr);
    initial begin
      $monitor(a,b,cin,cout,crr);
      a=`one;b=`zero;cin=`one;
      #5;
      a=`zero;b=`zero;
      #5;
      a=`one;b=`one;
      #5;
      $display("Test completed");
    end
endmodule