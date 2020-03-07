`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/05 17:05:52
// Design Name: 
// Module Name: clk1khz
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


module clk1khz(
    input clk,
    output reg clk_1k
    );
    reg [16:0] cnt;initial cnt=0;
    always @(posedge clk) begin
        cnt=cnt+1;
        if (cnt>100000) cnt=1;
        if (cnt==1) clk_1k=1'b0;
        else if (cnt==50001) clk_1k=1'b1;
    end
endmodule
