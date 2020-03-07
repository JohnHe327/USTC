`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/27 20:59:30
// Design Name: 
// Module Name: IReg
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


module IReg(
    input clk,rst,
    input [31:0]IRin,
    input IRWrite,
    output reg [31:0]IR
    );
    
    always @ (posedge clk,posedge rst)
    begin
        if(rst) IR <= 32'bx;
        else if(IRWrite) IR <= IRin;
        else IR <= IR;
    end
    
endmodule
