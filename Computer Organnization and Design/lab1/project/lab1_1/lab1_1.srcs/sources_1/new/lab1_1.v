`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/19 18:19:46
// Design Name: 
// Module Name: lab1_1
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


module lab1_1(
    input [3:0]a,
    input [3:0]b,
    input [3:0]s,
    output reg [3:0]y,
    output reg [2:0]f
    );
    
    always @*
    begin
        case(s)
            4'b0000://无符号加
                begin
                y=a+b;
                f[2]=(a+b)>5'b01111;
                f[1]=0;
                f[0]=y==0;
                end
            4'b1000://有符号加
                begin
                y=a+b;
                f[2]=0;
                f[1]=~a[3]&&~b[3]&&y[3] || a[3]&&b[3]&&~y[3];
                f[0]=y==0;
                end
            4'b0001://无符号减
                begin
                y=a-b;
                f[2]=a<b;
                f[1]=0;
                f[0]=a==b;
                end
            4'b1001://有符号减
                begin
                
                end
            4'b0010://与
                begin
                y=a&b;
                f[2:1]=0;
                f[0]=y==0;
                end
            4'b0011://或
                begin
                y=a|b;
                f[2:1]=0;
                f[0]=y==0;
                end
            4'b0100://非
                begin
                y=~a;
                f[2:1]=0;
                f[0]=y==0;
                end
            4'b0101://异或
                begin
                y=a^b;
                f[2:1]=0;
                f[0]=y==0;
                end
            default:
                begin
                y=0;
                f=3'b111;
                end
        endcase
    end
endmodule
