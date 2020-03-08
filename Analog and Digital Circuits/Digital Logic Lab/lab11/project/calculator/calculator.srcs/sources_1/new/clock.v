`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/07 15:39:58
// Design Name: 
// Module Name: clock
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


module clock(
    input CLK100MHZ,
    output reg Q,
    output clk1
    );
    reg [14:0] cnt;
    wire clk;
    clk_wiz_0 C(.clk_out1(clk),.clk_in1(CLK100MHZ));
    
    always @ (posedge clk)
    begin
        if (cnt>=15'd4999)
        begin
            cnt <=15'b0;
            Q<=~Q;
        end
        else cnt<=cnt+15'b1;
    end
    
    CLK500to1 C51(Q,clk1);
endmodule

module CLK500to1(
    input clk500,
    output reg clk1
    ); 
    reg [8:0]cnt1;
    always @ (posedge clk500)
    begin
        if (cnt1>=9'd499)
        begin
            cnt1 <=9'b0;
            clk1<=~clk1;
        end
        else cnt1<=cnt1+9'b1;
    end
endmodule
