`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 21:57:59
// Design Name: 
// Module Name: lab6_1_5
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


module lab6_1_5(
    input Clk,
    input En,
    input In,
    output reg [3:0]paraout,
    output Out
    );
    
    always @(posedge Clk)
        if(En)
        paraout<={paraout[2:0],In};
    assign Out=paraout[3];
endmodule
