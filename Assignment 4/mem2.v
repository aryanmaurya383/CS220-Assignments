`timescale 1ns/1ns

module mem2(clk,rst,w_en,address_a,address_b,data_in,mode,data_out);
input clk,rst,w_en,mode;
input [4:0] address_a,address_b,data_in;
output reg [4:0]data_out;
reg[4:0] data[31:0];
reg [4:0]address_reg;

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
            address_reg=address_b;

        end
        else begin
            if(w_en)begin
                data[address_a]=data_in;
            end
            else begin
                data[address_a]=data[address_a];
                // data_out=data[address_b];
            end
            data_out=data[address_reg];
            address_reg=address_b;
        end
        // $display("the data adress ", data[address], address);
    end

end
endmodule