// Code by Maurya Aryan 210595 and Depanshu Sahu 210316
module fetch_file(clk, pc,instruction, address, read_en,write_en, read_output, write_input,t4);
input  clk,read_en,write_en;
input [31:0]address;
input [31:0]write_input;
input wire [31:0]t4;
output  reg [31:0]instruction;
output  reg [31:0]read_output;
input wire[7:0] pc;
reg [31:0]veda_mem[31:0];
reg [5:0]counter;
reg [31:0]address2;
initial begin
counter=11;
//array
veda_mem[0]=32'd5; 
veda_mem[1]=32'd5; 
veda_mem[2]=32'd5; 
veda_mem[3]=32'd5; 
veda_mem[4]=-32'd3; 
veda_mem[5]=32'd9; 
veda_mem[6]=32'd1; 
veda_mem[7]=32'd5; 
veda_mem[8]=32'd5; 
veda_mem[9]=32'd50; 


//MIPS Bubble sort code
veda_mem[11]=32'b001000_00000_01000_0000000000000000; //13
veda_mem[12]=32'b001000_00000_01001_0000000000001010; //14 //stroing "n=10" directly
veda_mem[13]=32'b001001_01001_01001_0000000000000001; //15
veda_mem[14]=32'b001000_00000_01010_0000000000000000; //18
veda_mem[15]=32'b000100_01010_01001_0000_0000_0000_1101; //20
veda_mem[16]=32'b001000_00000_01011_0000000000000000; //21
veda_mem[17]=32'b000001_01001_01011_0000000000001001; //25
veda_mem[18]=32'b001000_01011_01100_0000000000000000; //26
veda_mem[19]=32'b000000_01100_01000_0110000000100000; //27
veda_mem[20]=32'b100011_01100_01101_0000000000000000; //28
veda_mem[21]=32'b100011_01100_01110_0000000000000001; //29
veda_mem[22]=32'b000110_01101_01110_0000000000000010; //30
veda_mem[23]=32'b101011_01100_01101_0000000000000001; //31
veda_mem[24]=32'b101011_01100_01110_0000000000000000; //32
veda_mem[25]=32'b001000_01011_01011_0000000000000001; //34
veda_mem[26]=32'b000010_00000_00000_0000000000010001; //35
veda_mem[27]=32'b001000_01010_01010_0000000000000001; //37
veda_mem[28]=32'b000010_00000_00000_0000000000001111; //38
veda_mem[29]=32'b111111_01010_01010_0000000000000001; //59
end

always @(posedge clk) begin
    if(write_en)begin //for store word
    veda_mem[address]=write_input;
    end
    if(instruction[31:26] == 6'b101011)begin //for store word
    instruction=veda_mem[pc+1];
    end
    else begin
    instruction=veda_mem[pc];
    end
    if(instruction[31:26]==6'b100011)begin //for load word
        address2=instruction[15:0]+ t4;
        read_output=veda_mem[address2];
    end
    
    if(instruction[31:26]==6'b111111)begin
    $display($signed(veda_mem[0]));
    $display($signed(veda_mem[1]));
    $display($signed(veda_mem[2]));
    $display($signed(veda_mem[3]));
    $display($signed(veda_mem[4]));
    $display($signed(veda_mem[5]));
    $display($signed(veda_mem[6]));
    $display($signed(veda_mem[7]));
    $display($signed(veda_mem[8]));
    $display($signed(veda_mem[9]));
    $finish;
    end
    // $display("pc: ",pc);
end
endmodule;