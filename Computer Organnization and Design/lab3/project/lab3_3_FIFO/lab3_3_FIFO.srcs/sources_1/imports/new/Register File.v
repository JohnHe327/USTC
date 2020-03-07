`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 08:29:29
// Design Name: 
// Module Name: Register File
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


module RegisterFile(
    input [2:0] ra,ra1,wa,
    input [3:0] wd,
    input we,
    input rst,
    input clk,
    output [3:0] rd,rd1
    );
    reg [3:0]RF[7:0];
    
    assign rd=RF[ra];
    assign rd1=RF[ra1];
    
    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            RF[0]=0;RF[1]=0;RF[2]=0;RF[3]=0;
            RF[4]=0;RF[5]=0;RF[6]=0;RF[7]=0;
        end
        else
        begin
         if(we)
            RF[wa]=wd;
        end
    end
endmodule
