`timescale 1ns / 1ps



module fowarding(
    input Regwrite,                          
    input [4:0] Rs1,                         // Rs1 represent ID/EX.Rs1
    input [4:0] Rs2,                         // Rs2 represent ID/EX.Rs2
    input [4:0] Rd1,                         // Rd1 represent EX/MEM.RD
    input [4:0] Rd2,                         // Rd2 represent MEM/WB.RD
    output reg[1:0] ForwardA,
    output reg [1:0] ForwardB
    );
    // forwardA=00 means that the first ALU operand comes from register file source=ID/Ex register
    // forwardA=10 means that the first ALU operand comes from prior ALU result source=EX/MEM register
    // forwardA=01 means that the first ALU operand comes from data memory or an earlier ALU result
    // forwardB=00 means that the second ALU operand comes from register file source=ID/Ex register
    // forwardB=10 means that the second ALU operand comes from prior ALU result source=EX/MEM register
    // forwardB=01 means that the second ALU operand comes from data memory or an earlier ALU result
    always@(Regwrite or Rs1 or Rs2 or Rd1 or Rd2 )
    begin
    if((Regwrite==1'b1) && Rd1 !=0 && Rd1==Rs1)   //EX/MEM.RD==ID/EX.RS1
    ForwardA <= 2'b10;
    else if((Regwrite==1'b1) && Rd2 !=0 && Rd2==Rs1)// MEM/WB.RD==ID/EX.RS1
    ForwardA <= 2'b01;
    else
    ForwardA <= 2'b00;
    
    if((Regwrite==1'b1) && Rd1 !=0 && Rd1==Rs2)//EX/MEM.RD==ID/EX.RS2
    ForwardB <= 2'b10;
    else if((Regwrite==1'b1) && Rd2 !=0 && Rd2==Rs2)//MEM/WB.RD==ID/EX.RS2
    ForwardB <= 2'b01;
    else
    ForwardB <= 2'b00;
    
    
    end
endmodule
