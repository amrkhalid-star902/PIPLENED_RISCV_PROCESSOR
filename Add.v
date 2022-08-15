`timescale 1ns / 1ps



module Add #(width=32)(
    input [width-1:0]A1,
    input[width-1:0] A2,
    output [width-1:0]Y
    );
    assign Y=A1+A2;
endmodule
