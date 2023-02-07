`timescale 1ns / 1ns

module mod10counter(clk,reset,q);
// parameter W=50_000_000;
parameter W=1;

input clk,reset;
output reg [3:0] q;

reg [31:0] one_sec_counter;

always @(posedge (clk) or posedge(reset)) begin: temp1
    if(reset)begin
        one_sec_counter=32'b0;
    end
    else begin
        if(one_sec_counter==W)begin
            one_sec_counter=32'b0;
        end
        else begin 
            one_sec_counter=one_sec_counter+1;
        end
    end
end

always @(posedge (clk) or posedge(reset)) begin:temp2
    if(reset) begin
        q=0;
    end
    else begin 
        if(one_sec_counter==W)begin
            if(q>=9)begin 
                q=0;
            end
            else begin
                q=q+1;
            end
        end
        else begin
            q=q;
        end
    end
end

endmodule



