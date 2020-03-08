`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 20:20:14
// Design Name: 
// Module Name: Register_reset_set_load
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


module Register_reset_set_load(
    input [3:0]D,
    input Clk,
    input load,
    input Set,
    input reset,
    output reg [3:0]Q
    );
    
    always @(posedge Clk)
            if (reset)
            begin
                Q <= 4'b0;
            end
            else if(Set)
            begin
                Q<=4'b1111;
            end
            else if (load)
            begin
                Q <= D; 
            end
endmodule
