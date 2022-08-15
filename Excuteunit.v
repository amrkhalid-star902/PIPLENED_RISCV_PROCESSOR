`timescale 1ns / 1ps


module Excuteunit #(parameter width=32)(
    input[width-1:0] PC,RD1,RD2,immediatevalue,
    input [4:0] Rd,[3:0]ALUcontrolinput,[8:0] controlsignal,
    input [4:0] Rs1,Rs2,Rd1,Rd2,
    input [width-1:0] ALUIN,Writedatain,
    output zero,[width-1:0] ALUresult,branchaddress,ReadData22,
    output [4:0] rd, [5:0] controlSignal
    );
    wire [1:0] ForwardA,ForwardB;
    wire [width-1:0] immediateout,Aluinput1,Aluinput2,MUXout,Branchaddress,ALuresult;
    wire Zero;
    wire [3:0] Alucontrol;
    fowarding F1(controlsignal[6],Rs1,Rs2,Rd1,Rd2,ForwardA,ForwardB);
    Shift #(width) S1(immediatevalue,immediateout);
    Add   #(width) A1(PC,immediateout,Branchaddress);
    MUX31 #(width) M5(RD1,Writedatain,ALUIN,ForwardA,Aluinput1);
    // the mux choose the first input to alu from:
    // RD1 :readdata1 result from decode stage
    // Writedatain : the output of write back stage
    // ALUIN: pervious output of alu
    MUX31 #(width) M6(RD2,Writedatain,ALUIN,ForwardB,MUXout);
    // the mux choose the second input to alu from:
    // RD2 :readdata1 result from decode stage
    // Writedatain : the output of write back stage
    // ALUIN: pervious output of alu
    MUX21 #(width) M2(MUXout,immediatevalue,controlsignal[8],Aluinput2);
    // this mux choose the second input to alu whether 
    //it immediate value or normal data
    ALU_CONTROL A2(controlsignal[1:0],ALUcontrolinput[3],ALUcontrolinput[2:0],Alucontrol);
    ALU #(width)A3(Alucontrol,Aluinput1,Aluinput2,ALuresult,Zero);
    assign branchaddress=Branchaddress;
    assign ALUresult=ALuresult;
    assign zero=Zero;
    assign rd=Rd;
    assign ReadData22=RD2;
    assign controlSignal=controlsignal[7:2];
endmodule
