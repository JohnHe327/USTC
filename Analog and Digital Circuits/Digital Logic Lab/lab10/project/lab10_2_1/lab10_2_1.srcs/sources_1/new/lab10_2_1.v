`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/30 15:01:58
// Design Name: 
// Module Name: lab10_2_1
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


module lab10_2_1(
    input Clk,
    input rst,
    input [1:0]ain,
    output reg yout
    );
    reg y,ynext;
    reg [1:0]state;
    
    always @(posedge Clk or posedge rst)
    begin
        if(rst)
        begin
            state<=2'b0;
            y<=0;
        end
        else
        begin
            state<=ain;
            y<=ynext;
        end
    end
    
    always @(state or ain or y)
    begin
    if(ain==00)
        case(state)
        2'b01:ynext<=0;
        2'b11:ynext<=1;
        2'b10:ynext<=~y;
        default:ynext<=y;
        endcase
    end
    
    always @(y)
    yout<=y;
endmodule
