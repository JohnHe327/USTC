`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/07 17:54:31
// Design Name: 
// Module Name: bi2seg_r
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


module bi2seg_r(
    input [15:0]result,
    output reg [7:0] segout0,
    output reg [7:0] segout1,
    output reg [7:0] segout2,
    output reg [7:0] segout3
    );
    
    wire [3:0] d0,d1,d2,d3;
    wire [7:0]seg0,seg1,seg2,seg3;
    assign d0=result%10;
    assign d1=result/10%10;
    assign d2=result/100%10;
    assign d3=result/1000%10;
    
    bcd2seg b0(d0,seg0);
    bcd2seg b1(d1,seg1);
    bcd2seg b2(d2,seg2);
    bcd2seg b3(d3,seg3);
    
    always @ *
    begin
        if(result>16'd9999)
        begin
            segout3<=8'b10111111;
            segout2<=8'b10000110;
            segout1<=8'b10001000;
            segout0<=8'b00001000;
        end
        else
        begin
            segout0<=seg0;
            segout1<=seg1;
            segout2<=seg2;
            segout3<=seg3;
        end
    end
endmodule

module bcd2seg(
    input [3:0]x,
    output [7:0] seg0
    );
    assign seg0[0] = x==4'd1 || x==4'd4;
    assign seg0[1] = x==4'd5 || x==4'd6;
    assign seg0[2] = x==4'd2;
    assign seg0[3] = x==4'd1 || x==4'd4 || x==4'd7;
    assign seg0[4] = x==4'd1 || x==4'd3 || x==4'd4 || x==4'd5 || x==4'd7 || x==4'd9;
    assign seg0[5] = x==4'd1 || x==4'd2 || x==4'd3 || x==4'd7;
    assign seg0[6] = x==4'd1 || x==4'd7 || x==4'd0;
    assign seg0[7] = 1;
endmodule
