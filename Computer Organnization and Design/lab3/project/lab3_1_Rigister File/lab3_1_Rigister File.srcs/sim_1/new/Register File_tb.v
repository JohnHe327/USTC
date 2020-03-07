`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 12:17:54
// Design Name: 
// Module Name: RF_tb
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


module RF_tb(
    );
    reg [3:0] ra0,ra1,wa,wd;
    reg we,rst,CLK100MHZ;
    wire [3:0] rd0,rd1;
    wire clk;
    RegisterFile DUT(ra0,ra1,wa,wd,we,rst,CLK100MHZ,rd0,rd1,clk);
    initial begin
      CLK100MHZ=0;
        forever #5 CLK100MHZ=~CLK100MHZ;
    end
    initial begin
      rst=0;
        #3 rst=1;
        #3 rst=0;
    end
    
    initial begin
        ra0=0;
    end
    initial begin
        ra1=1;
    end
    initial begin
        wa=1;
    end
    initial begin
        wd=10;
        #2000000000 wd=3;
    end
    initial begin
        we=0;
        #10 we=1;
        #1000000000 we=0;
    end
endmodule
