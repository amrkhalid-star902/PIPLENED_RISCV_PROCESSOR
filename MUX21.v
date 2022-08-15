`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////


module MUX21#(parameter width=32)(
    input[width-1:0] a,
    input[width-1:0] b,
    input sel,
    output [width-1:0] out
    );
    assign out=(sel==1'b0)?a:b;
endmodule
