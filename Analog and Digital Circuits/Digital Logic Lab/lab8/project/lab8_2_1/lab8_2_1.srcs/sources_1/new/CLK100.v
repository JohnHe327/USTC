`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 17:20:17
// Design Name: 
// Module Name: lab8_2_1
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


module lab8_2_1(
    input CLK100MHZ,
    input rst,
    output [7:0] AN,
    output [6:0] seg
    );
    wire Q500,Q1,t,lock;
    wire [3:0]x0;
    wire [3:0]x1;
    wire [6:0] seg0;
    wire [6:0] seg1;
    CLOCK500HZ CL1(rst,CLK100MHZ,Q500);
    CLOCK1HZ CL2(rst,Q500,Q1);
    
    c_counter_binary_0 C0 (.CLK(Q1),.CE(1'b1),.THRESH0(t),.Q(x0));
    c_counter_binary_1 C1 (.CLK(Q1),.CE(t),.THRESH0(lock),.Q(x1));
    bcdto7 B0(x0,seg0);
    bcdto7 B1(x1,seg1);
    SW S0(Q500,seg1,seg0,seg,AN);
    
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

module bcdto7(
    input [3:0]x,
    output [6:0] seg0
    );
            assign seg0[0] = (x==4'd1) || (x==4'd4);
            assign seg0[1] = (x==4'd5) || (x==4'd6);
            assign seg0[2] = x==4'd2;
            assign seg0[3] = (x==4'd1) || (x==4'd4) || (x==4'd7);
            assign seg0[4] = x==4'd1 || (x==4'd3) || x==4'd4 || x==4'd5 || x==4'd7 || x==4'd9;
            assign seg0[5] = (x==4'd1) || (x==4'd2) || (x==4'd3) || x==4'd7;
            assign seg0[6] = (x==4'd1)|| (x==4'd7) || x==4'd0;
endmodule

module CLOCK500HZ(
    input rst,
    input CLK100MHZ,
    output reg Q
    );
    reg [14:0] cnt;
    wire clk,lock;
    clk_wiz_0 C(.clk_out1(clk),.reset(rst),.locked(lock),.clk_in1(CLK100MHZ));
    
    always @ (posedge clk or posedge rst)
    begin
        if(rst)
        begin
            cnt<=15'b0;
            Q<=0;
        end
        else if (cnt>=15'd4999)
        begin
            cnt <=15'b0;
            Q<=~Q;
        end
        else cnt<=cnt+15'b1;
    end
endmodule

module CLOCK1HZ(
    input rst,
    input Q500,
    output reg Q
    );
    reg [9:0] cnt;
    
    always @ (posedge Q500 or posedge rst)
    begin
        if(rst)
        begin
            cnt<=10'b0;
            Q<=0;
        end
        else if (cnt>=10'd249)
        begin
            cnt <=10'b0;
            Q<=~Q;
        end
        else cnt<=cnt+10'b1;
    end
endmodule
