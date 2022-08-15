`timescale 1ns / 1ps



module ALU_CONTROL(
    input [1:0] Aluop,
    input funct7,
    input [2:0] funct3,
    output reg [3:0] control
    );
    always@(*)
    begin
    case(Aluop)
    2'b00: control <=4'b0010; // Load or store instruction
    2'b01: control <=4'b0110;// Branch Instruction
    2'b10:case({funct7,funct3}) //R-Type instructions
    4'b0000 : control<=4'b0010; //add
    4'b1000 : control<=4'b0110; //sub
    4'b0111 : control<=4'b0000; //and
    4'b0110 : control<=4'b0001; //OR
    4'b0001 : control<=4'b0011; //shift left logical
    4'b0010 : control<=4'b0100; // set less than
    4'b0011 : control<=4'b0101; //set less than unsigned
    4'b0100 : control<=4'b0111; //xor
    4'b0101 : control<=4'b1000; //shift right logical
    4'b1101 : control<=4'b1010; // shift right arthimatic
    default : control<=4'bxxxx;
    endcase
    2'b11:case({funct7,funct3}) //I-Type instructions
    4'b0000 : control<=4'b0010; //addi
    4'b0010 : control<=4'b0100; // set less than immediate
    4'b0011 : control<=4'b0101; //set less than unsigned immediate
    4'b0100 : control<=4'b0111; //xori
    4'b0110 : control<=4'b0001; //ORI
    4'b0111 : control<=4'b0000; //andi
    4'b0001 : control<=4'b0011; //shift left logical immediate
    4'b0101 : control<=4'b1000; //shift right logical immediate
    4'b1101 : control<=4'b1010; // shift right arthimatic immediate
    default : control<=4'bxxxx;
    endcase
    endcase

    end     
endmodule
