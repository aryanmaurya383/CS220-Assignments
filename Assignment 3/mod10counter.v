`timescale 1ns/1ns

 module mod10counter(clk,reset,q);
 input clk,reset;
 reg [3:0]state,nextstate;
 output reg [3:0]q;
 reg [26:0]counter;
//----------Next state logic------
always@(posedge clk) begin:next_state
if(reset)begin
    counter<=0;
    nextstate<=0;
end
// else if(counter==27'd2)begin
//     counter<=0;
//     if(state<9) begin
//         nextstate<=state+1;
//     end
//     else begin
//         nextstate<=0;
//     end 
// end
// else begin
//     counter<=counter+1;
// end
else begin
    if(state<9) begin
        nextstate<=state+1;
    end
    else begin
        nextstate<=0;
    end 
end
end


// --------Sequential logic-------
always@(posedge clk || reset) begin : seq_logic
    if(reset) begin
        state<=0;
    end
    else begin
        state<=nextstate;
    end
end

// -------Output logic----------
always@(posedge clk)begin:output_logic
    if(reset)begin
        q<=0;
    end
    else begin
        q<=state;
    end
    // $monitor(q);
end
 endmodule
 
