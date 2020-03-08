`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/09 13:47:51
// Design Name: 
// Module Name: lab6_2_3
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


module lab6_2_3(
    input Clk,
    input load,
    input CLR,
    input En,
    output [3:0]Q
    );
    reg [3:0] count;
    wire Cdone;
    
    assign Cdone=~(|count);
    assign Q=count;
    always @(posedge Clk)
        if (CLR)
            count<=0;
        else if(En)
            if(load | Cdone)
                count=4'b1010;
            else count<=count-1;
endmodule
