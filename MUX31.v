`timescale 1ns / 1ps



module MUX31 #(parameter width=32)(
    input[width-1:0] a,
    input [width-1:0] b,
    input [width-1:0] c,
    input [1:0] sel,
    output out
    );
    assign out=(sel == 2'b10) ? c : (sel == 2'b01) ? b : a;
endmodule
