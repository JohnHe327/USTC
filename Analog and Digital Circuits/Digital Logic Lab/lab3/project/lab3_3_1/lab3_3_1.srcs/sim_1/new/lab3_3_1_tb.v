`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/26 14:11:49
// Design Name: 
// Module Name: lab3_3_1_tb
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


module lab3_3_1_tb(
    );
    reg [1:0] a;
    reg [1:0] b;
    wire lt;
    wire gt;
    wire eq;
    integer k=4'd0;
    
    lab3_3_1 DUT(.a(a),.b(b),.lt(lt),.gt(gt),.eq(eq));
    
    initial
    begin
        {a,b}=0;
        for(k=0;k<16;k=k+1)
            # 5 {a,b}=k;
        #10;
    end
endmodule
