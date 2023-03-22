module control_unit(instruction,clk,read_reg);
input clk;
input[4:0] read_reg;
input [31:0] instruction;
wire[5:0] opcode;
reg[5:0] funct; 
assign opcode = instruction[31:26];
reg[31:0] registers [31:0];
reg[31:0] memory [31:0];
reg[31:0] read_1,read_2;
reg[31:0] result;
integer i;
reg[1:0] state;
parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

always@(posedge clk)
begin 

    // if(opcode == 8 || opcode == 12 || opcode == 13 || opcode == 14 || opcode == 15){
        
    // }
    funct = instruction[5:0];
    case(state)
        
    S0: begin
        
        case(opcode)
        6'b001000: begin 
               // registers[instruction[25:21]]
            read_1 <= registers[instruction[20:16]];
            read_2 <= instruction[15:0]; 
            
        end
        6'b001001: begin 
            read_1 <= registers[instruction[20:16]];
            read_2 <= instruction[15:0];
            //registers[instruction[25:21]] = registers[instruction[20:16]]&instruction[15:0]; 
        end
        6'b0: begin
           
           case(funct)
           6'd24,6'd20 : begin
               read_1 <= registers[instruction[25:21]];
               read_2 <= registers[instruction[20:16]];
           end
            6'b0,6'b10 : begin 
                read_1 <= registers[instruction[20:16]];
                read_2 <= instruction[10:6];
                
            end
           endcase
            
            
            //read_2 <= registers[instruction[20:16]];
        // case(funct)
        //         6'd24: registers[instruction[15:11]] = registers[instruction[25:21]] + registers[instruction[20:16]];
        //         6'd20: registers[instruction[15:11]] = registers[instruction[25:21]] - registers[instruction[20:16]];
        // endcase
        end

        endcase
        state <= S1;
    end
    S1: begin
        case(opcode)
        6'b001000: begin 
               // registers[instruction[25:21]]
            result <= read_1 + read_2; 
        end
        6'b001001: begin 
            result <= read_1&read_2;
            //registers[instruction[25:21]] = registers[instruction[20:16]]&instruction[15:0]; 
        end
        6'b0: begin
            // read_1 <= registers[instruction[25:21]];
            // read_2 <= registers[instruction[20:16]];
        case(funct)
                6'd24: result <= read_1 + read_2;
               // 6'd20: result <= read_1 - read_2;
                6'd20: begin 
                    
                    result <= read_1 + read_2;
                end
                6'b0: 
                    result <= read_1<<read_2;

                
                6'b10: result <= read_1>>read_2;
        endcase        
        end
        endcase
        state<=S2;
        
    end
    S2:
    begin
        case(opcode)
        6'b001000: begin 
            registers[instruction[25:21]] <= result;
            
        end
        6'b001001: begin 
            
            registers[instruction[25:21]] <= result; 
        end
        6'b0: begin
            registers[instruction[15:11]] <= result;
        // case(funct)
        //         6'd24: registers[instruction[15:11]] = registers[instruction[25:21]] + registers[instruction[20:16]];
        //         6'd20: registers[instruction[15:11]] = registers[instruction[25:21]] - registers[instruction[20:16]];
        // endcase
        end

        endcase
        state<= S0;
    end
    endcase
    $display();
    $display(state,read_reg, registers[instruction[20:16]], result, read_1,read_2,registers[read_reg]);
    
end   
initial 
begin 
    state = 0;
    for(i=0;i<32;i=i+1)
    registers[i] = 32'b0;
end
endmodule
