`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/02 00:32:07
// Design Name: 
// Module Name: lab5_1_2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab5_1_2(
    input S,
    input R,
    input E,
    output Q,
    output Qbar
    );
    wire a,b;
    assign #2 a=E&R;
    assign #2 b=E&S;
    assign #2 Q=~(Qbar | a);
    assign #2 Qbar=~(Q | b);
endmodule
