`timescale 1ns / 1ps


module PCCounter #(parameter width=32)(
    input clk,PCen,[width-1:0]PC1,
    output reg [width-1:0]PC
    );
    always@(posedge clk)
    begin
    if(PCen==1'b0)
    PC <=PC;
    else
    PC <=PC1;
    
    
    end
endmodule
