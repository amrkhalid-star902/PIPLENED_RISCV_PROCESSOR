`timescale 1ns / 1ps



module DataMemory #(parameter width=32)(
    input clk,
    input Memwrite,
    input Memread,
    input[width-1:0] address,
    input[width-1:0] Writedata,
    output reg [width-1:0]  Readdata
    );
    reg [width-1:0] mem1[1023:0];
    initial
    begin
    mem1[0] = 32'h00000000;
    mem1[1] = 32'h00000001;
    mem1[2] = 32'h00000002;
    mem1[3] = 32'h00000003;
    mem1[4] = 32'h00000004;
    mem1[5] = 32'h00000005;
    mem1[6] = 32'h00000006;
    mem1[7] = 32'h00000007;
    end
    always@(*)
    begin
    if(Memread==1'b1)
    Readdata <=mem1[address];
    else if(Memwrite==1'b1)
    mem1[address] <= Writedata;
    end
    
endmodule
