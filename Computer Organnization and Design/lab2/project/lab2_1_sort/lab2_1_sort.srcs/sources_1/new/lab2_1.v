`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/28 19:29:53
// Design Name: 
// Module Name: lab2_1
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


module lab2_1(
    input [3:0]x0,
    input [3:0]x1,
    input [3:0]x2,
    input [3:0]x3,
    input clk,
    input rst,
    output [3:0]s0,
    output [3:0]s1,
    output [3:0]s2,
    output [3:0]s3,
    output reg done
    );
    reg [3:0] r0,r1,r2,r3;
    reg [2:0] state;
    always @ (posedge rst or posedge clk)
    begin
        if(rst)
        begin
            r0<=x0;
            r1<=x1;
            r2<=x2;
            r3<=x3;
            state<=0;
            done<=0;
        end
        else
        begin
            case (state)
            3'd0:
            begin
                if(r0<r1)
                begin
                    r1<=r0;
                    r0<=r1;
                end
                state<=1;
            end
            3'd1:
            begin
                if(r1<r2)
                begin
                    r1<=r2;
                    r2<=r1;
                end
                state<=2;
            end
            3'd2:
            begin
                if(r2<r3)
                begin
                    r2<=r3;
                    r3<=r2;
                end
                state<=3;
            end
            3'd3:
            begin
                if(r0<r1)
                begin
                    r1<=r0;
                    r0<=r1;
                end
                state<=4;
            end
            3'd4:
            begin
                if(r1<r2)
                begin
                    r1<=r2;
                    r2<=r1;
                end
                state<=5;
            end
            3'd5:
            begin
                if(r0<r1)
                begin
                    r1<=r0;
                    r0<=r1;
                end
                state<=6;
                done<=1;
            end
            endcase
        end
    end
    assign s0=r0;
    assign s1=r1;
    assign s2=r2;
    assign s3=r3;
endmodule
