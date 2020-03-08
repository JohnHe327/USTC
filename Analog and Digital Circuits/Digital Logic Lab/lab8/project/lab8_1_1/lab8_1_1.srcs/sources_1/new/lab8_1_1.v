`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 13:07:20
// Design Name: 
// Module Name: lab8_1_1
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


module lab8_1_1(
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
            cnt<=23'b0;
            Q<=0;
        end
        else if (cnt>=23'd2499999)
        begin
            cnt <=23'b0;
            Q<=~Q;
        end
        else cnt<=cnt+23'b1;
    end
endmodule
