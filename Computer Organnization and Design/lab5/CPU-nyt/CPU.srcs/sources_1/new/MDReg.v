`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/27 21:06:20
// Design Name: 
// Module Name: MDReg
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


module DReg(
    input clk,rst,
    input [31:0]in,
    input en,
    output reg [31:0]out
    );
    always @ (posedge clk,posedge rst)
    begin
        if(rst) out <= 32'bx;
        else if(en)out <= in;
        else out <= out;
    end
endmodule
