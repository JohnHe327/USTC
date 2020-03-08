`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/01 21:02:54
// Design Name: 
// Module Name: add_two_values_function
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


module add_two_values_function(
    input [3:0]a,
    input [3:0]b,
    output reg [4:0]sum
    );
    
    function [4:0] add_two_values;
        input [3:0]x;
        input [3:0]y;
        add_two_values[4:0]=x+y;
    endfunction
    
    always @ *
    sum=add_two_values(a,b);
    
endmodule
