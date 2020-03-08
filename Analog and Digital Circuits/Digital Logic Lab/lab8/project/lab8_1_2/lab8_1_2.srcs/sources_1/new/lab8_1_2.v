`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 15:37:24
// Design Name: 
// Module Name: lab8_1_2
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


module lab8_1_2(
    input CLK100MHZ,
    input rst,
    input [3:0] bcdin,
    output [6:0] seg,
    output [7:0] AN
    );
    wire Q,lock;
    wire [6:0] seg0;
    wire [6:0] seg1;
    lab2(bcdin,seg0,seg1);
    CLOCK(rst,CLK100MHZ,Q,lock);
    SW(Q,seg1,seg0,seg,AN);
endmodule

module SW(
    input Q,
    input [6:0] seg0,
    input [6:0] seg1,
    output reg [6:0]seg,
    output [7:0]an
    );
    assign an[7:2]=6'b111111;
    assign an[1]=Q;
    assign an[0]=~Q;
    always @ *
    begin
        if(Q) seg=seg1;
        else seg=seg0;
    end
endmodule

module CLOCK(
    input rst,
    input CLK100MHZ,
    output reg Q,
    output lock
    );
    reg [22:0] cnt;
    wire clk;
    clk_wiz_0 C(.clk_out1(clk),.reset(rst),.locked(lock),.clk_in1(CLK100MHZ));
    
    always @ (posedge clk or posedge rst)
    begin
        if(rst)
        begin
            cnt<=10'b0;
            Q<=0;
        end
        else if (cnt>=10'd499)
        begin
            cnt <=10'b0;
            Q<=~Q;
        end
        else cnt<=cnt+10'b1;
    end
endmodule

module lab2(
    input [3:0] v,
    output [6:0] seg0,
    output [6:0] seg1
    );
    reg [3:0] m;
    reg z;
    always @ *
    begin
        if(v>4'b1001)
        begin
            m=v-4'b1010;
            z=1;
        end
        else
        begin
            m=v;
            z=0;
        end
    end
    bcdto7 U7 (m,z,seg0,seg1);
endmodule

module bcdto7(
    input [3:0] x,
    input z,
    output [6:0] seg0,
    output [6:0] seg1
    );
        assign seg0[0] = (x==4'd1) || (x==4'd4);
        assign seg0[1] = (x==4'd5) || (x==4'd6);
        assign seg0[2] = x==4'd2;
        assign seg0[3] = (x==4'd1) || (x==4'd4) || (x==4'd7);
        assign seg0[4] = x==4'd1 || (x==4'd3) || x==4'd4 || x==4'd5 || x==4'd7 || x==4'd9;
        assign seg0[5] = (x==4'd1) || (x==4'd2) || (x==4'd3) || x==4'd7;
        assign seg0[6] = (x==4'd1)|| (x==4'd7) || x==4'd0;
        assign seg1[0]= z;
        assign seg1[1]= 0;
        assign seg1[2]= 0;
        assign seg1[3]= z;
        assign seg1[4]= z;
        assign seg1[5]= z;
        assign seg1[6]= 1;
endmodule