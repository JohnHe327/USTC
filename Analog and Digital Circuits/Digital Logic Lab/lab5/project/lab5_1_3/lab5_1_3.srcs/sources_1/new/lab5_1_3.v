`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/02 12:18:30
// Design Name: 
// Module Name: D_latch
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


module D_latch(
    input D,
    input E,
    output Q,
    output Qbar
    );
    wire a,b;
    assign #2 a=(~D)&E;
    assign #2 b=D&E;
    assign #2 Q=~(a|Qbar);
    assign #2 Qbar=~(b|Q);
endmodule
