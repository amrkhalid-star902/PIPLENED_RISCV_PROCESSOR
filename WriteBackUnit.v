`timescale 1ns / 1ps



module WriteBackUnit #(parameter width=32)(
    input [width-1:0]RD,ALUResult,[2:0] controlsignal,[4:0]Rd,
    output RegWrite,[width-1:0]Writeback,[4:0]rd
    );
    wire[width-1:0] writeback;
    MUX21#(width)M1(ALUResult,RD,controlsignal[2],writeback);
    
    assign Writeback=writeback;
    assign rd=Rd;
    assign RegWrite=controlsignal[1];
endmodule
