`timescale 1ns / 1ps


module ALU #(parameter width=32)(
input [3:0] controlsignal,
input [width-1:0] A,B,
output reg [width-1:0] Y,
output zero);

always@(*)
begin
if(controlsignal==4'b0000)
Y=A&B;
else if(controlsignal==4'b0001)
Y=A|B;
else if(controlsignal==4'b0010)
Y=A+B;
else if(controlsignal==4'b0110)
Y=A-B;
else if(controlsignal==4'b0011)
Y=A<<B;
else if(controlsignal==4'b0100)
begin
if((~A+1) <(~B+1))
Y=1;
else
Y=0;
end
else if(controlsignal==4'b0101)
begin
if(A <B)
Y=1;
else
Y=0;
end
else if(controlsignal==4'b0111)
Y=A^B;
else if(controlsignal==4'b1000)
Y=A >> B;
else if(controlsignal==4'b1010)
Y=A>>>B;
else
Y={width{1'bx}};
end
assign zero=(Y==0)?1:0;



   
    
    
endmodule
