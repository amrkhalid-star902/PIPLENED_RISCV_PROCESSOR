`timescale 1ns / 1ps


module Decodeunit #(parameter width=32)(
    input clk,RegWrite,[width-1:0]PC1,Instruction,
    WriteData,
    input[4:0] Rd,RD,
    input Memread,
    output [width-1:0]RD1,RD2,PC,immediatevalue,
    output [4:0] rd, [3:0] ALUcontrolinput,
    output [8:0] control, [4:0] Rs1,Rs2,
    output PCen,IFIDen);
    
    wire controlmux,Pcen,ifid;
    wire [width-1:0] ReadData11,ReadData22,immediateOut;
    wire [1:0] ALUop;
    wire ALUSrc,MemtoReg,Regwrite,MemRead,MemWrite,Branch,Jump;
    
    hazardunit H1(MemRead,Instruction[19:15],Instruction[24:20],RD,controlmux,Pcen,ifid);
    Maincontroller C1(Instruction[6:0],ALUSrc,MemtoReg,Regwrite,MemRead,MemWrite,Branch,Jump,ALUop);
    Registerfile #( width) RF1(clk,Regwrite,Instruction[19:15],Instruction[24:20],Rd,WriteData,ReadData11,ReadData22);
    Immediategeneration #(width) I1(Instruction,immediateOut);
    
    assign PC=PC1;
    assign control=(controlmux==1'b1)?{ALUSrc,MemtoReg,Regwrite,MemRead,MemWrite,Branch,Jump,ALUop}:0;
    assign RD1=ReadData11;   //RD=READDATA
    assign RD2=ReadData22;
    assign immediatevalue=immediateOut;
    assign ALUcontrolinput={Instruction[30],Instruction[14:12]};
    assign rd=Instruction[11:7];
    assign Rs1=Instruction[19:15];
    assign Rs2=Instruction[24:20];
    assign PCen=Pcen;
    assign IFIDen=ifid;
    
    
endmodule
