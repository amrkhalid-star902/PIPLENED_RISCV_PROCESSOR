`timescale 1ns / 1ps



module hazardunit(
    input Memread,
    input [4:0] Rs1,
    input [4:0] Rs2,
    input [4:0] Rd,
    output Controlmux,
    output Pcen, //PC enable signal
    output IFIDen // register between instruction fetch state and instruction decode state enable signal
    );
    
    // The true data dependence when register is read and at the same time instruction is loading the same redister
    // in this satiuation a stall must be occured and the following instruction mustnot be fetched to prevent any
    // unexpected output pc also should be unenabled 
    assign Controlmux=(Memread ==1'b0)?1:(Rs1==Rd | Rs2==Rd)?0:1;
    assign Pcen = (Memread ==1'b0)?1:(Rs1==Rd | Rs2==Rd)?0:1;
    assign IFIDen= (Memread ==1'b0)?1:(Rs1==Rd | Rs2==Rd)?0:1;
endmodule
