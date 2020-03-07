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
    input [3:0] ra0,ra1,wa,
    input [3:0] wd,
    input we,
    input rst,
    input CLK100MHZ,
    output [3:0] rd0,rd1,
    output clk
    );
    wire clk500,clk1;
    clock C(CLK100MHZ,clk500,clk1);
    reg [3:0]RF[15:0];
    
    assign rd0=RF[ra0];
    assign rd1=RF[ra1];
    assign clk=clk1;
    
    always @(posedge clk1 or posedge rst)
    begin
        if(rst)
        begin
            RF[0]=0;RF[1]=0;RF[2]=0;RF[3]=0;
            RF[4]=0;RF[5]=0;RF[6]=0;RF[7]=0;
            RF[8]=0;RF[9]=0;RF[10]=0;RF[11]=0;
            RF[12]=0;RF[13]=0;RF[14]=0;RF[15]=0;
        end
        else
        begin
         if(we)
            RF[wa]=wd;
        end
    end
endmodule
