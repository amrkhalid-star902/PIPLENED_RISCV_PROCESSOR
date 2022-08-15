`timescale 1ns / 1ps



module Shift #(parameter width=32)(
    input [width-1:0] In,
    output[width-1:0] Out
    );
    assign Out=In<<1;
endmodule
