`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/28 20:47:39
// Design Name: 
// Module Name: lab2_2
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


module lab2_2(
    input [3:0]X,
    input [3:0]y,
    input rst,
    input clk,
    output [3:0]q,
    output [3:0]r,
    output reg err,
    output reg done
    );
    reg [7:0] A,b;
    reg [2:0] state;
    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            A<={4'd0,X};
            b<={y,4'd0};
            done<=0;
            err<=0;
            state<=0;
        end
        else if(b==0) err<=1;
        else
        begin
            case(state)
            3'd0:
            begin
                A=A<<1;
                if(A>b) A=A-b+1;
                state=3'd1;
            end
            3'd1:
            begin
                A=A<<1;
                if(A>b) A=A-b+1;
                state=3'd2;
            end
            3'd2:
            begin
                A=A<<1;
                if(A>b) A=A-b+1;
                state=3'd3;
            end
            3'd3:
            begin
                A=A<<1;
                if(A>b) A=A-b+1;
                done=1;
                state=3'd4;
            end
            endcase
        end
    end
    assign {r,q}=A;
endmodule