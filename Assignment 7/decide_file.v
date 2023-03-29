`include "veda.v"
module decide_file(clk);
input clk;
// output reg[31:0] out;
wire [31:0]instruction;
reg signed [31:0] registers32[31:0];
reg [7:0] pc=0; 
fetch_file uut(clk,pc, instruction);

initial begin
registers32[1]=-32'd25;
registers32[2]=32'd15;
pc=0;
end


always @(negedge clk) begin


case (instruction[31:26])
6'b000000: begin
    case (instruction[5:0])
    6'b100000:begin
        registers32[instruction[15:11]]=registers32[instruction[25:21]] + registers32[instruction[20:16]];
        pc=pc+1;
        $display("add", registers32[0]);
    end
    6'b100010:begin
        registers32[instruction[15:11]]=registers32[instruction[25:21]] - registers32[instruction[20:16]];
        pc=pc+1;
        $display("sub", registers32[0]);
    end
    6'b100001: begin
        registers32[instruction[15:11]]=$unsigned(registers32[instruction[25:21]]) + $unsigned(registers32[instruction[20:16]]);
        pc=pc+1;
        $display("addu", registers32[0]);
    end
    6'b100011:begin
        registers32[instruction[15:11]]=$unsigned(registers32[instruction[25:21]]) - $unsigned(registers32[instruction[20:16]]);
        pc=pc+1;
        $display("subu", registers32[0]);
    end
    6'b100100: begin
        registers32[instruction[15:11]]=registers32[instruction[25:21]] & registers32[instruction[20:16]];
        pc=pc+1;
        $display("and", registers32[0]);
    end
    6'b100101: begin
        registers32[instruction[15:11]]=registers32[instruction[25:21]] | registers32[instruction[20:16]];
        pc=pc+1;
        $display("or", registers32[0]);
    end
    6'b000000:  begin
        registers32[instruction[15:11]]=registers32[instruction[20:16]] <<instruction[10:6];
        pc=pc+1;
        $display("sll", registers32[0]);
    end
    6'b000010:begin
        registers32[instruction[15:11]]=registers32[instruction[20:16]] >>instruction[10:6];
        pc=pc+1;
        $display("slr");
    end
    6'b001000: begin
        registers32[31]=pc+4;
        pc=pc+1+registers32[instruction[25:21]];
        $display("jr");
    end
    6'b101010:  begin
        registers32[instruction[15:11]]=registers32[instruction[25:21]] < registers32[instruction[20:16]];
        pc=pc+1;
        $display("slt", registers32[0]);
    end
    endcase
end
6'b001000: begin
        registers32[instruction[20:16]]=registers32[instruction[25:21]] + registers32[instruction[15:0]];
        pc=pc+1;
        $display("addi", registers32[0]);
    end
6'b001001: begin
        registers32[instruction[20:16]]=registers32[instruction[25:21]] - registers32[instruction[15:0]];
        pc=pc+1;
        $display("subi", registers32[0]);
    end
6'b001100: begin
        registers32[instruction[20:16]]=registers32[instruction[25:21]] & registers32[instruction[15:0]];
        pc=pc+1;
        $display("andi", registers32[0]);
    end
6'b001101: begin
        registers32[instruction[20:16]]=registers32[instruction[25:21]] | registers32[instruction[15:0]];
        pc=pc+1;
        $display("ori", registers32[0]);
    end
6'b100011: begin 
        pc=pc+1;
        $display("lw");
end
6'b101011: begin
        pc=pc+1;
        $display("sw");
end
6'b000100: begin
    if(instruction[25:21]==instruction[20:16]) pc=pc+1+registers32[instruction[15:10]];
    else pc=pc+1;
    $display("beq");
end
6'b000101: begin
    if(instruction[25:21]!=instruction[20:16]) pc=pc+1+registers32[instruction[15:10]];
    else pc=pc+1;
    $display("bne");
end
6'b000111: begin
    if(instruction[25:21]>instruction[20:16]) pc=pc+1+registers32[instruction[15:10]];
    else pc=pc+1;
    $display("bgt");
end
6'b000001: begin
    if(instruction[25:21]>=instruction[20:16]) pc=pc+1+registers32[instruction[15:10]];
    else pc=pc+1;
    $display("bgte");
end
6'b000001: begin
    if(instruction[25:21]<instruction[20:16]) pc=pc+1+registers32[instruction[15:10]];
    else pc=pc+1;
    $display("ble");
end
6'b000110: begin
    if(instruction[25:21]<=instruction[20:16]) pc=pc+1+registers32[instruction[15:10]];
    else pc=pc+1;
    $display("bleq");
end
6'b000010: begin
    pc=pc+1+instruction[25:0];
    $display("j");
end
6'b000011: begin
    registers32[31]=pc+1;
    pc=pc+1+instruction[25:0];
    $display("jal");
end
6'b001010: begin
        registers32[instruction[15:11]]=registers32[instruction[25:21]] < registers32[instruction[20:16]];
        pc=pc+1;
        $display("slti", registers32[0]);
    end

endcase
// out=registers32[0];
end




endmodule