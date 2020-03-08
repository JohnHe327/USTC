`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/23 15:00:56
// Design Name: 
// Module Name: lab9_2_1
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


(* USE_DSP48="no"*)module lab9_2_1(
    input CLK100MHZ,
    input rst,
    input en,
    input mood,
    output reg [7:0]led
    );
    parameter COUNT_SIZE=8'd20;
    wire clk5,lock;
    wire clk1;
    clk_wiz_0 C0(.clk_out1(clk5),.reset(rst),.locked(lock),.clk_in1(CLK100MHZ));
    CLK5to1(clk5,rst,lock,clk1);
    
    always @ (posedge clk1 or posedge rst)
    begin
    if(en)
        if(rst)
        led<=8'b00000000;
        else if(mood)
        begin
            if(led>=COUNT_SIZE-1) led<=8'b00000000;
            else  led<=led+1;
        end
        else
        begin
            if(led==0) led<=COUNT_SIZE-1;
            else  led<=led-1;
        end
    end
endmodule

module CLK5to1(
    input clk5,
    input rst,
    input lock,
    output reg clk1
    ); 
    reg [22:0]cnt;
    always @ (posedge clk5 or posedge rst)
    begin
    if(lock)
    begin
        if(rst)
        begin
            cnt<=23'b0;
            clk1<=0;
        end
        else if (cnt>=23'd2499999)
        begin
            cnt <=23'b0;
            clk1<=~clk1;
        end
        else cnt<=cnt+23'b1;
    end
    end
endmodule