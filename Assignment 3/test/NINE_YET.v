module NINE_YET (IN,OUT,reset);
  input  [3:0] IN;
  input reset;
  output reg [1:0]OUT;
  always @ ( * ) begin
    if(IN>=9 || reset) OUT<=2'b01; //Q[3] should be toggled the next cycle, Q[2] should not
    else OUT<={~IN[2],~IN[0]}; //just pass Q` of Tff[2] and Tff[0]
  end
endmodule // NINE_YET