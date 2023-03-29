module fetch_file(clk, pc,instruction);
input  clk;
output  reg [31:0]instruction;
input wire[7:0] pc;
reg[4:0] r0,r1,r2;
reg [15:0]imm;
reg [31:0]veda_mem[24:0];
reg [5:0]counter;

initial begin
r0=5'd0;
r1=5'd1;
r2=5'd2;
imm=16'b0;
counter=0;

veda_mem[0]=32'b0; veda_mem[0][31:26]=6'b000000;veda_mem[0][25:21]=r1;veda_mem[0][20:16]=r2;veda_mem[0][15:11]=r0;veda_mem[0][5:0]=6'b100000;//add
veda_mem[1]=32'b0; veda_mem[1][31:26]=6'b000000;veda_mem[1][25:21]=r1;veda_mem[1][20:16]=r2;veda_mem[1][15:11]=r0;veda_mem[1][5:0]=6'b100010;//sub
veda_mem[2]=32'b0; veda_mem[2][31:26]=6'b000000;veda_mem[2][25:21]=r1;veda_mem[2][20:16]=r2;veda_mem[2][15:11]=r0;veda_mem[2][5:0]=6'b100001;//addu
veda_mem[3]=32'b0; veda_mem[3][31:26]=6'b000000;veda_mem[3][25:21]=r1;veda_mem[3][20:16]=r2;veda_mem[3][15:11]=r0;veda_mem[3][5:0]=6'b100011;//subu
veda_mem[4]=32'b0; veda_mem[4][31:26]=6'b001000;veda_mem[4][25:21]=r1;veda_mem[4][20:16]=r0;veda_mem[4][15:0]=imm;//addi
veda_mem[5]=32'b0; veda_mem[5][31:26]=6'b001001;veda_mem[5][25:21]=r1;veda_mem[5][20:16]=r0;veda_mem[5][15:0]=imm;//addiu
veda_mem[6]=32'b0; veda_mem[6][31:26]=6'b000000;veda_mem[6][25:21]=r1;veda_mem[6][20:16]=r2;veda_mem[6][15:11]=r0;veda_mem[6][5:0]=6'b100100;//and
veda_mem[7]=32'b0; veda_mem[7][31:26]=6'b000000;veda_mem[7][25:21]=r1;veda_mem[7][20:16]=r2;veda_mem[7][15:11]=r0;veda_mem[7][5:0]=6'b100101;//or
veda_mem[8]=32'b0; veda_mem[8][31:26]=6'b001100;veda_mem[8][25:21]=r1;veda_mem[8][20:16]=r0;veda_mem[8][15:0]=imm;//andi
veda_mem[9]=32'b0; veda_mem[9][31:26]=6'b001101;veda_mem[9][25:21]=r1;veda_mem[9][20:16]=r0;veda_mem[9][15:0]=imm;//ori
veda_mem[10]=32'b0; veda_mem[10][31:26]=6'b000000;veda_mem[10][25:21]=5'b0;veda_mem[10][20:16]=r2;veda_mem[10][15:11]=r0;veda_mem[10][10:6]=5'd10;veda_mem[10][5:0]=6'b000000;//sll
veda_mem[11]=32'b0; veda_mem[11][31:26]=6'b000000;veda_mem[11][25:21]=5'b0;veda_mem[11][20:16]=r2;veda_mem[11][15:11]=r0;veda_mem[11][10:6]=5'd10;veda_mem[11][5:0]=6'b000010;//srl
veda_mem[12]=32'b0; veda_mem[12][31:26]=6'b100011;veda_mem[12][25:21]=r1;veda_mem[12][20:16]=r0;veda_mem[12][15:0]=16'd10;//lw
veda_mem[13]=32'b0; veda_mem[13][31:26]=6'b101011;veda_mem[13][25:21]=r1;veda_mem[13][20:16]=r0;veda_mem[13][15:0]=16'd10;//sw
veda_mem[14]=32'b0; veda_mem[14][31:26]=6'b000100;veda_mem[14][25:21]=r1;veda_mem[14][20:16]=r0;veda_mem[14][15:0]=16'd10;//beq
veda_mem[15]=32'b0; veda_mem[15][31:26]=6'b000101;veda_mem[15][25:21]=r1;veda_mem[15][20:16]=r0;veda_mem[15][15:0]=16'd10;//bne
veda_mem[16]=32'b0; veda_mem[16][31:26]=6'b000111;veda_mem[16][25:21]=r1;veda_mem[16][20:16]=r0;veda_mem[16][15:0]=16'd10;//bgt
veda_mem[17]=32'b0; veda_mem[17][31:26]=6'b000001;veda_mem[17][25:21]=r1;veda_mem[17][20:16]=r0;veda_mem[17][15:0]=16'd10;//bgte
veda_mem[18]=32'b0; veda_mem[18][31:26]=6'b000110;veda_mem[18][25:21]=r1;veda_mem[18][20:16]=r0;veda_mem[18][15:0]=16'd10;//ble
veda_mem[19]=32'b0; veda_mem[19][31:26]=6'b000001;veda_mem[19][25:21]=r1;veda_mem[19][20:16]=r0;veda_mem[19][15:0]=16'd10;//bleq
veda_mem[20]=32'b0; veda_mem[20][31:26]=6'b000010;veda_mem[20][25:0]=26'd10;//j 
veda_mem[21]=32'b0; veda_mem[21][31:26]=6'b000000;veda_mem[21][25:21]=r0;veda_mem[21][5:0]=6'b001000;//jr
veda_mem[22]=32'b0; veda_mem[22][31:26]=6'b000011;veda_mem[22][25:0]=26'd10;//jal 
veda_mem[23]=32'b0; veda_mem[23][31:26]=6'b000000;veda_mem[23][25:21]=r1;veda_mem[23][20:16]=r2;veda_mem[23][15:11]=r0;veda_mem[23][5:0]=6'b101010;//slt
veda_mem[24]=32'b0; veda_mem[24][31:26]=6'b001010;veda_mem[24][25:21]=r1;veda_mem[24][20:16]=r0;veda_mem[24][15:0]=imm;//slti
end

always @(posedge clk) begin
    instruction=veda_mem[pc];
    $display("pc: ",pc);
    // counter=counter+1;

end

endmodule;