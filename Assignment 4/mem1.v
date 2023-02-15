`timescale 1ns/1ns

module mem1(clk,rst,w_en,address,data_in,mode,data_out);
input clk,rst,w_en,mode;
input [4:0] address,data_in;
output reg [4:0]data_out;
reg[4:0] data[31:0];
reg [4:0] address_reg;

generate
    
genvar i;
for(i=0;i<32;i=i+1)begin
    always @( rst) begin
    data[i]=0;
    end
end

endgenerate

always @(posedge clk) begin
    
    if(rst)begin
            
    end
    else begin
        if(mode)begin
            data_out=data[address_reg];
            address_reg=address;
        end
        else begin
            if(w_en)begin
                data[address]=data_in;
            end
            else begin
                data[address]=data[address];
                // data_out=data[address];
            end
            data_out=data[address_reg];
            address_reg=address;

        end
        // $display("the data adress ", data[address], address);
    end

end
endmodule