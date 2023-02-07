`timescale 1ns/1ns
module counter (    clk,reset,count);
input clk,reset;
wire Up=1;
output reg [3:0]count=0;
parameter W=50_000_000;
reg [31:0] inti_counti;

always @(negedge(clk) or posedge(reset) )begin
if(reset)
begin
inti_counti=32'b0;
end
else
begin
if(inti_counti==W)
begin
inti_counti=32'b0;
end
else
begin
inti_counti=inti_counti+1;
end
end
end
always @(negedge(clk) or posedge(reset) )begin
    if(reset==1)
    begin
        count=0;

    end
    else
    begin
   if(inti_counti==W)
begin
        if(Up==1)
        begin
          if(count==9)count=0;
          else count=count+1;
        end
        else
        begin
            if(count==0)count=15;
            else count=count-1;
        end
    end
else
begin
count=count;
end
end
end

endmodule
