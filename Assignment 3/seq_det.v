module seq_det(clk,reset,req1,gnt1);
    input clk,reset,req1;
    output gnt1;

    wire clk,reset,req1;
    reg gnt1;

    parameter SIZE = 4;
    parameter IDLE = 4'b0000, STATE1 = 4'b1000,STATE2 = 4'b0100,STATE3=4'b1010,STATE4=4'b0101;
    
    reg [SIZE-1:0] state,next_state;

    always @(req1 or clk or reset) begin: FSM
        case (state)
         IDLE: if(req1==1'b1) begin
                next_state<=STATE1;
               end
               else next_state<=IDLE;
         STATE1: if(req1==1'b0) begin
                next_state<=STATE2;
                end
                else next_state<=STATE1;
        STATE2: if(req1==1'b1) begin
                next_state<=STATE3;
                end
                else next_state<=IDLE;
        STATE3: if(req1==1'b0) begin
                next_state<=STATE4;
                end
                else next_state<=STATE1;
        STATE4: if(req1==1'b1) begin
                next_state<=STATE3;
                end
                else next_state<=IDLE;
         default: next_state<=IDLE;
        endcase
    end
//---------Sequence logic--------------------
    always @(posedge clk) begin
        if(reset==1'b1) begin
            state <=IDLE;
        end
        else  begin
            state<=next_state;
        end
    end
//--------Output logic------------------------
    always @(posedge clk) begin
            if(state == 4'b0101) begin 
                gnt1<=1'b1;
            end
            else begin 
                gnt1<=1'b0;
            end
            $display("state - %b",state);
    end
endmodule