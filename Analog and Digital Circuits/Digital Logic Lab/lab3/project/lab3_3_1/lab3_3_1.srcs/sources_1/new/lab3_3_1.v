`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/25 23:52:57
// Design Name: 
// Module Name: lab3_3_1
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


module lab3_3_1(
    input [1:0]a,
    input [1:0]b,
    output lt,
    output gt,
    output eq
    );
    reg [2:0] ROM[15:0];
    
    initial $readmemb ("F:\ROM_data.txt",ROM,0,15);
    assign {lt,gt,eq}=ROM[{a,b}];
endmodule
