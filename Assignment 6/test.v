module test(clk,reset,a,b,out);
input [3:0]a,b;
input clk,reset;
output reg [3:0]out;
reg [3:0]load_a, load_b,load_out;

// always@(reset)begin
//  load_a=0;
//  load_b=0;
//  load_out=0;
// end
reg [3:0]state;

always@(posedge clk)begin
 if(reset)begin
    state=0;
    load_a=0;
    load_b=0;
 end
 else begin
 case (state) 
 0: begin 
    load_a=a;
 load_b=b;
 state=1;
 end
 1: begin
     load_out=load_a+load_b;
 state=2;
 end
 2:begin
     out=load_out;
 state=0;
 end
 default: state=0;
 endcase
 end
 
end

endmodule