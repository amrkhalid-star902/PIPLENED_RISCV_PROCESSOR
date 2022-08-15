`timescale 1ns / 1ps




module Registerfile#(parameter width=32)(
    input clk,Regwrite,[4:0]Read1,[4:0]Read2,[4:0]WriteReg,
    [width-1:0]Writedata,
    output [width-1:0]Data1,Data2
    
    );
    reg [width-1:0] RF [width-1:0];
    initial
    begin
    RF[1]=32'h00000001;
    RF[2]=32'h00000002;
    RF[3]=32'h00000003;
    RF[4]=32'h00000004;
    RF[5]=32'h00000005;
    RF[6]=32'h00000006;
    RF[7]=32'h00000007;
    RF[8]=32'h00000008;
    RF[9]=32'h00000009;
    RF[10]=32'h00000010;
    end
    always@(posedge clk)
    begin
    if(Regwrite)
    RF[WriteReg] <= Writedata;
    end
    assign Data1=(Read1 !=0)?RF[Read1]:0;
    assign Data2=(Read2 !=0)?RF[Read2]:0;
    
endmodule
