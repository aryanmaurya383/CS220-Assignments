`include "fetch_file.v"
module decide_file(clk);
input clk;
wire [31:0]instruction;


    fetch_file uut(clk, instruction);

always @(negedge clk) begin


case (instruction[31:26])
6'b000000: begin
    case (instruction[5:0])
    6'b100000: $display("add\n");
    6'b100010: $display("sub\n");
    6'b100001: $display("addu\n");
    6'b100011: $display("subu\n");
    6'b100100: $display("and\n");
    6'b100101: $display("or\n");
    6'b000000: $display("sll\n");
    6'b000010: $display("slr\n");
    6'b001000: $display("jr\n");
    6'b101010: $display("slt\n");
    endcase
end
6'b001000:$display("addi\n");
6'b001001 :$display("subi\n");
6'b001100 :$display("andi\n");
6'b001101 :$display("ori\n");
6'b100011 :$display("lw\n");
6'b101011 :$display("sw\n");
6'b000100 :$display("beq\n");
6'b000101 :$display("bne\n");
6'b000111 :$display("bgt\n");
6'b000001 :$display("bgte\n");
6'b000001 :$display("ble\n");
6'b000110 :$display("bleq\n");
6'b000010 :$display("j\n");
6'b000011 :$display("jal\n");
6'b001010 :$display("slti\n");

endcase
end

endmodule