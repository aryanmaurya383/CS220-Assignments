module mux(cin4,cin3,cin2,cin1,switch1,switch2,cout);
    input [31:0] cin1,cin2,cin3,cin4;
    input  switch1,switch2;
    output [31:0] cout;
    wire temp1,temp2,temp3,temp4,negSwitch1,negSwitch2;
    wire [31:0]mid1,mid2,mid3,mid4;
    not(negSwitch1,switch1);
    not(negSwitch2,switch2);
    and(temp1,switch2,switch1);
    and(temp2,negSwitch2,switch1);
    and(temp3,switch2,negSwitch1);
    and(temp4,negSwitch2,negSwitch1);
    generate
        genvar i;
        for(i=0;i<32;i=i+1) begin : mux_std
            and(mid1[i],temp1,cin1[i]);
            and(mid2[i],temp2,cin2[i]);
            and(mid3[i],temp3,cin3[i]);
            and(mid4[i],temp4,cin4[i]);
            or(cout[i],mid1[i],mid2[i],mid3[i],mid4[i]);
        end
    endgenerate
endmodule