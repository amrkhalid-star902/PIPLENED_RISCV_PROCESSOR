`timescale 1ns / 1ps



module Fetchunit #(parameter width=32)(
    input clk,Asel,PCen,[width-1:0]PCplus4,
    [width-1:0]branchaddress,
    output [width-1:0] PC,Instruction
    
    );
    wire [width-1:0]PC1,P,RD;
    MUX21 #(width) M1(PCplus4,branchaddress,Asel,PC1);
    PCCounter #(width) P1(clk,PCen,PC1,P);
    adder #(width) A1(P,PCplus4);
    InstructionMemory #(width) I1(P,RD);
    assign PC=P;
    assign Instruction=RD;
    
endmodule
