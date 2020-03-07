`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/26 17:28:00
// Design Name: 
// Module Name: PC
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


module PC(
    input clk,rst,en,
    input [31:0]PCin,
    output reg [31:0]PCout
    );
    always @ (posedge clk, posedge rst)
    begin
        if(rst) PCout <= 0;
        else if(en) PCout <= PCin;
        else PCout <= PCout;
    end
endmodule
