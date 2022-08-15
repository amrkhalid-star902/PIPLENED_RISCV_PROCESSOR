`timescale 1ns / 1ps



module Immediategeneration #(parameter width=32)(
    input[width-1:0] In,
    output reg[width-1:0] Out
    );
    always@(*)
    begin
    case(In[6:0])
    7'b0000011: Out <={{{width-12}{In[31]}},In[31:20]}; //immediate value of load instruction
    7'b0100011: Out <={{{width-12}{In[31]}},In[31:25],In[11:7]}; //immadiate value of store instruction
    7'b1100011: Out <={{{width-12}{In[31]}},In[31],In[7],In[30:25],In[11:7]}; // immadiate value for branch type instructions
    7'b0010011: Out <={{{width-12}{In[31]}},In[31:20]}; // immadiate value fpr I-type instruction
    7'b1100111: Out <={{{width-12}{In[31]}},In[31:20]}; // immadiate value for jalr instruction
    7'b1101111: Out <={{{width-20}{In[31]}},In[31],In[19:12],In[20],In[30:21]};//immadiate value for jal instruction
    default: Out <={width{1'h0}}; 
    endcase
    end
endmodule
