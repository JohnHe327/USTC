`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/23 16:26:27
// Design Name: 
// Module Name: lab9_3_1
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


module lab9_3_1(
    input rst,
    input en,
    input CLK100MHZ,
    output reg [7:0]AN,
    output reg [7:0]seg
    );
    wire clk10,clk500;
    CLOCK500HZ CL1(0,CLK100MHZ,clk500);
    CLK500to10(clk500,0,1,clk10);
    
    wire fs,ss,sm;
    wire [3:0] F,S0,S1,M;
    wire [7:0] f,s0,s1,m;
    counter_f c1 (.CLK(clk10),.CE(en),.SCLR(rst),.THRESH0(fs),.Q(F));
    counter_s0 c2 (.CLK(clk10),.CE(fs),.SCLR(rst),.THRESH0(ss),.Q(S0));
    counter_s1 c3 (.CLK(clk10),.CE(ss&fs),.SCLR(rst),.THRESH0(sm),.Q(S1));
    counter_m c4 (.CLK(clk10),.CE(fs&ss&sm),.SCLR(rst),.Q(M));
    
    bcdto7 B0(F,f);
    bcdto7 B1(S0,s0);
    bcdto7 B2(S1,s1);
    bcdto7 B3(M,m);
    
    wire [3:0]sw;
    SW(clk500,sw);
    always @(posedge clk500)
    begin
    case(sw)
    4'b0000:
        begin
        AN=8'b11110111;
        seg=m;
        end
    4'b0001:
        begin
        AN=8'b11110111;
        seg=8'b01111111;
        end
    4'b0010:
        begin
        AN=8'b11111011;
        seg=s1;
        end
    4'b0011:
        begin
        AN=8'b11111101;
        seg=s0;
        end
    4'b0100:
        begin
        AN=8'b11111101;
        seg=8'b01111111;
        end
    4'b0101:
        begin
        AN=8'b11111110;
        seg=f;
        end
    endcase
    end
endmodule

module SW(
    input clk500,
    output reg [3:0]sw
    );
    always @(posedge clk500)
    begin
        if(sw>=4'd5)
            sw<=4'd0;
        else sw<=sw+1;
    end
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

module CLK500to10(
    input clk5,
    input rst,
    input lock,
    output reg clk1
    ); 
    reg [5:0]cnt;
    always @ (posedge clk5 or posedge rst)
    begin
    if(lock)
    begin
        if(rst)
        begin
            cnt<=6'b0;
            clk1<=0;
        end
        else if (cnt>=6'd24)
        begin
            cnt <=6'b0;
            clk1<=~clk1;
        end
        else cnt<=cnt+6'b1;
    end
    end
endmodule

module bcdto7(
    input [3:0]x,
    output [7:0] seg0
    );
            assign seg0[0] = (x==4'd1) || (x==4'd4);
            assign seg0[1] = (x==4'd5) || (x==4'd6);
            assign seg0[2] = x==4'd2;
            assign seg0[3] = (x==4'd1) || (x==4'd4) || (x==4'd7);
            assign seg0[4] = x==4'd1 || (x==4'd3) || x==4'd4 || x==4'd5 || x==4'd7 || x==4'd9;
            assign seg0[5] = (x==4'd1) || (x==4'd2) || (x==4'd3) || x==4'd7;
            assign seg0[6] = (x==4'd1)|| (x==4'd7) || x==4'd0;
            assign seg0[7] = 1;
endmodule