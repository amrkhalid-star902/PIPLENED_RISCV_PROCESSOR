`timescale 1ns / 1ps



module Maincontroller(
    input [6:0] opcode,
    output ALUsrc,MemtoReg,Regwrite,MemRead,MemWrite,Branch,Jump,[1:0]ALUop
    );
    reg[8:0] control;
    assign {ALUsrc,MemtoReg,Regwrite,MemRead,MemWrite,Branch,Jump,ALUop}=control;
    always@(*)
    begin
    case(opcode)
    7'b0110011: control <= 9'b001000010; //R-type
    7'b0000011: control <= 9'b111100000;//load-instruction
    7'b0100011: control <= 9'b1x0010000;// S-type
    7'b1100011: control <= 9'b0x0001001;// SB-type
    7'b0010011: control <= 9'b101000011;//I-type
    7'b1100111: control <= 9'b111xx0100;//jalr instruction
    7'b1101111: control <= 9'b111xx0100;
    default: control <=9'bxxxxxxxxx;
    endcase
    end
endmodule
