`timescale 1ns / 1ps



module Pipeline(
    input clk
    );
    wire[31:0] N1,N2,N6,N7,N8,N9,N10,N11,N12,N16,N17,N18,PCplus4;
    wire[4:0] N3;//destination regesister
    wire[3:0] N4; //ALU controller input
    wire[8:0] N5;// control signals
    wire N13; //Zero bit
    wire[4:0] N14; //destination register
    wire[5:0] N15; //control signal
    wire N21,N22;
    wire[31:0] N23;
    wire[4:0] N24;
    wire[2:0] N19; //control signal
    wire[4:0] N20; //destination register
    wire[4:0] N25,N26; //Rs1 and Rs2 field
    reg[31:0] IFID1,IFID2;
    reg[31:0] IDEU1,IDEU2,IDEU3,IDEU4;
    reg[4:0] IDEU5;
    reg[3:0] IDEU6;
    reg[8:0] IDEU7;
    reg[31:0] EUMA1,EUMA2,EUMA3;
    reg EUMA4; // zer bit
    reg[4:0] EUMA5 ;// destination register
    reg[5:0] EUMA6; // control signal
    reg[31:0]MAWB1,MAWB2,MAWB3;
    reg[2:0] MAWB4; // control signal
    reg[4:0] MAWB5; // destination register
    reg Asel,RegWrite;
    reg[31:0] Writedata;
    reg[4:0] Rd;
    reg[4:0] IDEU8;
    reg[4:0] IDEU9;
    wire N27,N28;
    reg PCen,IFIDen;
    always@(posedge clk)
    begin
    if(IFIDen==0)
    begin
    IFID1 <=IFID1;
    IFID2 <=IFID2;
    end
    else
    begin
    IFID1 <=N1; //PC
    IFID2 <=N2; //Instruction
    end
    IDEU1 <= N6; //PC
    IDEU2 <= N7; //RD1(READ DATA 1)
    IDEU3 <= N8; //RD2 (READ DATA 2)
    IDEU4 <= N9; //Immediate value
    IDEU5 <= N3 ;//Destination Register
    IDEU6 <= N4; //Funct7 +Funct3
    IDEU7 <= N5; //control signals
    IDEU8 <= N25; //RS1
    IDEU9 <= N26; //RS2
    IFIDen <= N28; //IFIDen
    EUMA1 <= N10; //ALU RESULT
    EUMA2 <= N11; // Branch address 
    EUMA3 <= N12; //RD2
    EUMA4 <= N13; //ZERO
    EUMA5 <= N14; //Destination register
    EUMA6 <= N15; //Control signals
    MAWB1 <= N16; //Branch address
    MAWB2 <= N17; //Memory Data
    MAWB3 <= N18; //ALU RESULT
    MAWB4 <= N19; //control signal
    MAWB5 <= N20; //Destination register
    Asel <=N21;
    RegWrite <=N22;
    Writedata <=N23;
    Rd <=N24;
    PCen <= N27;
    
    end
    Fetchunit  #(32) F1(clk,Asel,PCen,PCplus4,N16,N1,N2);
    Decodeunit #(32) D1(clk,RegWrite,IFID1,IFID2,Writedata,Rd,IDEU5,IDEU7[5],N7,N8,N6,N9,N3,N4,N5,N25,N26,N27,N28);
    Excuteunit #(32) E1(IDEU1,IDEU2,IDEU3,IDEU4,IDEU5,IDEU6,IDEU7,IDEU8,IDEU9,MAWB5, EUMA5, EUMA1,MAWB3,N13,N10,N11,N12,N14,N15);
    Memoryaccessunit #(32) M1(clk,EUMA2 ,EUMA1,EUMA3,EUMA4,EUMA6,EUMA5,N16,N17,N18,N21,N19,N20);
    WriteBackUnit    #(32) W1(MAWB2, MAWB3,MAWB4,MAWB5,N22,N23,N24);
    
    
endmodule
