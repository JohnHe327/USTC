`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/30 12:44:15
// Design Name: 
// Module Name: lab10_1_1
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


module lab10_1_1(
    input Clk,
    input rst,
    input xin,
    output reg yout,
    output reg [3:0]cnt
    );
    reg [3:0]next;
    
    always @(posedge Clk or posedge rst)
    begin
        if(rst)
        begin
            cnt<=4'b0;
        end
        else
        begin
            cnt<=next;
        end
    end
    
    always @(cnt or xin)
    begin
        case(xin)
        1:next=cnt+4'b0001;
        0:next=cnt;
        default:next=4'b0;
        endcase
    end
    
    always @(cnt or xin)
    begin
    yout=0;
    if(xin)
    begin
        if(cnt%3==0)
        yout=1;
    end
    end
endmodule
