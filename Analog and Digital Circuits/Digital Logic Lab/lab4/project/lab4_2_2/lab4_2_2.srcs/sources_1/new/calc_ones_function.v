`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/01 21:11:33
// Design Name: 
// Module Name: calc_ones_function
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


module calc_ones_function(
    input [7:0] a,
    output reg [2:0] out
    );
    
    function [2:0]calc_ones;
        input [7:0] a;
        integer k;
        begin
            calc_ones=0;
            for(k=0;k<8;k=k+1)
            if(a[k]==1) calc_ones=calc_ones+3'b001;
        end
    endfunction
    
    always @ *
    out=calc_ones(a);
endmodule
