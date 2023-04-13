// Code by Maurya Aryan 210595 and Depanshu Sahu 210316
`include "veda.v"
module decide_file(clk);
input clk;
reg read_en,write_en,cont;
wire [31:0]instruction;
reg [31:0]address,t4;
wire [31:0]read_output;
reg [31:0]write_input;
reg signed [31:0] registers32[31:0];
reg [7:0] pc=0; 
fetch_file uut(clk,pc, instruction,address,read_en,write_en,read_output,write_input,t4);

initial begin
registers32[0]=32'b0;
pc=8'd11;
address=0;
read_en=0;
write_en=0;
cont=1;
end

//using negedge to avoid clash of reading and writing at the same time
always @(negedge clk)  begin
if(write_en==1)pc=pc+1; // signal for store word
write_en=0;

case (instruction[31:26])
6'b000000: begin
    case (instruction[5:0])
    6'b100000:begin
        registers32[instruction[15:11]]=registers32[instruction[25:21]] + registers32[instruction[20:16]];
        pc=pc+1;
        //$display("add", registers32[instruction[15:11]]);
    end
    6'b100010:begin
        registers32[instruction[15:11]]=registers32[instruction[25:21]] - registers32[instruction[20:16]];
        pc=pc+1;
        //$display("sub", registers32[0]);
    end
    6'b100001: begin
        registers32[instruction[15:11]]=$unsigned(registers32[instruction[25:21]]) + $unsigned(registers32[instruction[20:16]]);
        pc=pc+1;
        //$display("addu", registers32[0]);
    end
    6'b100011:begin
        registers32[instruction[15:11]]=$unsigned(registers32[instruction[25:21]]) - $unsigned(registers32[instruction[20:16]]);
        pc=pc+1;
        //$display("subu", registers32[0]);
    end
    6'b100100: begin
        registers32[instruction[15:11]]=registers32[instruction[25:21]] & registers32[instruction[20:16]];
        pc=pc+1;
        //$display("and", registers32[0]);
    end
    6'b100101: begin
        registers32[instruction[15:11]]=registers32[instruction[25:21]] | registers32[instruction[20:16]];
        pc=pc+1;
        //$display("or", registers32[0]);
    end
    6'b000000:  begin
        registers32[instruction[15:11]]=registers32[instruction[20:16]] <<instruction[10:6];
        pc=pc+1;
        //$display("sll", registers32[instruction[15:11]]);
    end
    6'b000010:begin
        registers32[instruction[15:11]]=registers32[instruction[20:16]] >>instruction[10:6];
        pc=pc+1;
        //$display("slr");
    end
    6'b001000: begin
        registers32[31]=pc+1;
        pc=pc+1+registers32[instruction[25:21]];
        //$display("jr");
    end
    6'b101010:  begin
        registers32[instruction[15:11]]=registers32[instruction[25:21]] < registers32[instruction[20:16]];
        pc=pc+1;
        //$display("slt", registers32[0]);
    end
    endcase
end
6'b001000: begin
        registers32[instruction[20:16]]=registers32[instruction[25:21]] + instruction[15:0];
        pc=pc+1;
        //$display("addi", registers32[instruction[20:16]]);
    end
6'b001001: begin
        registers32[instruction[20:16]]=registers32[instruction[25:21]] - instruction[15:0];
        pc=pc+1;
        //$display("subi", registers32[instruction[20:16]]);
    end
6'b001100: begin
        registers32[instruction[20:16]]=registers32[instruction[25:21]] & instruction[15:0];
        pc=pc+1;
        //$display("andi", registers32[0]);
    end
6'b001101: begin
        registers32[instruction[20:16]]=registers32[instruction[25:21]] | instruction[15:0];
        pc=pc+1;
        //$display("ori", registers32[0]);
    end
6'b100011: begin 
        registers32[instruction[20:16]]=read_output;
        //$display("lw",instruction[15:0], instruction[25:21] ,read_output);
        pc=pc+1;
end
6'b101011: begin
        write_en=1;
        address=instruction[15:0]+registers32[instruction[25:21]];
        write_input=registers32[instruction[20:16]];
        //$display("sw");
end
6'b000100: begin
    if(registers32[instruction[25:21]]==registers32[instruction[20:16]]) pc=pc+1+instruction[15:0];
    else pc=pc+1;
    //$display("beq",registers32[instruction[25:21]] , " ", registers32[instruction[20:16]]);
end
6'b000101: begin
    if(registers32[instruction[25:21]]!=registers32[instruction[20:16]]) pc=pc+1+instruction[15:0];
    else pc=pc+1;
    //$display("bne");
end
6'b000111: begin
    if(registers32[instruction[25:21]]<registers32[instruction[20:16]]) pc=pc+1+instruction[15:0];
    else pc=pc+1;
    //$display("bgt");
end
6'b000001: begin
    if(registers32[instruction[25:21]]<=registers32[instruction[20:16]]) pc=pc+1+instruction[15:0];
    else pc=pc+1;
    //$display("bgte",registers32[instruction[25:21]] , " ", registers32[instruction[20:16]]);
end
6'b000110: begin
    if(registers32[instruction[25:21]]<=registers32[instruction[20:16]]) pc=pc+1+instruction[15:0];
    else pc=pc+1;
    //$display("bleq", registers32[instruction[25:21]], " ",registers32[instruction[20:16]]  ,instruction[15:0]);
end
6'b000010: begin
    pc=instruction[25:0];
    //$display("j");
end
6'b000011: begin
    registers32[31]=pc+1;
    pc=pc+1+instruction[25:0];
    //$display("jal");
end
6'b001010: begin
        registers32[instruction[15:11]]=registers32[instruction[25:21]] < registers32[instruction[20:16]];
        pc=pc+1;
        //$display("slti", registers32[0]);
    end

6'b111111: begin
//$display("finish");
#10;$finish;
end

endcase
t4=registers32[12];
end
endmodule