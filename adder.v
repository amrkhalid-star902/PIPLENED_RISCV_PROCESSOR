`timescale 1ns / 1ps


module adder #(parameter width=32)(
input [width-1:0] PC,
output [width-1:0] PCplus4 
);
assign PCplus4=PC+4;
endmodule
