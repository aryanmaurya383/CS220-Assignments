module test;
reg clock,i_p,reset;
wire o_p;
MJ uut (.clock(clock),.reset(reset),.i_p(i_p),.o_p(o_p));
initial begin
    
    reset=1'b1;
    clock=0;
    #20
    reset=1'b0;
    i_p=0;
    clock=1;
    #20
    $display(o_p);
    i_p=1;
    clock=0;
    #20
    $display(o_p);
    i_p=1;
    clock=1;
    #20
    $display(o_p);
    i_p=0;
    clock=0;
    #20
    $display(o_p);
    i_p=0;
    clock=1;
    #20
    $display(o_p);
    i_p=1;
    clock=0;
    #20
    $display(o_p);
    i_p=0;
    clock =1;
    #20
    $display(o_p);
    i_p=1;
    clock=0;
    #20
    $display(o_p);
    i_p=0;
    clock=1;
    #20
    $display(o_p);
    #69
    $finish;
end
endmodule