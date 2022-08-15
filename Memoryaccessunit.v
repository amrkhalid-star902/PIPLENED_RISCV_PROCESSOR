`timescale 1ns / 1ps



module Memoryaccessunit #(parameter width=32)(
    input clk,[width-1:0]branchaddress,ALUResult,RD2,
    input zero,[5:0] controlsignal,[4:0]Rd,
    output [width-1:0] branchadd,RD,Aluresult,
    output Asel,[2:0] Controlsignal,[4:0]rd
    );
    wire [width-1:0] ReadData;
    wire andoutput;
    and A1(andoutput,zero,controlsignal[1]);
    DataMemory #( width) D1(clk,controlsignal[2],controlsignal[3],ALUResult,RD2,ReadData);
    
    
    assign branchadd=branchaddress;
    assign Asel=andoutput;
    assign rd=Rd;
    assign RD=ReadData;
    assign Aluresult=ALUResult;
    assign Controlsignal={controlsignal[5:4],controlsignal[0]};
    
     
endmodule
