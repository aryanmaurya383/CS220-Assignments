module TFF (CLK,T,OUT,reset);
  input CLK,T,reset;
  output reg OUT=0;
  always @ ( posedge CLK || reset) begin
    if (reset) begin
        OUT<=0;
    end
    else begin

        if(T) OUT<=~OUT;
        else  OUT<=OUT;
    end
  end
endmodule // TFF