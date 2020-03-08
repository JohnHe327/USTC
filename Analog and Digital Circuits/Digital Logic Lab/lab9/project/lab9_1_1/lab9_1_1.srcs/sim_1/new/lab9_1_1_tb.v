`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/23 14:44:02
// Design Name: 
// Module Name: lab9_1_1_tb
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


module lab9_1_1_tb(
    );
    reg a,b,ci;
    wire s,co;
    FA #(3,3,1) f1(a,b,ci,s,co);
    initial
    begin
      a=0;
        #40 a=1;
    end
    
    initial
    begin
      b=0;
        #20 b=1;
        #20 b=0;
        #20 b=1;
    end
    
    initial
    begin
      ci=0;
        #10 ci=1;
        #10 ci=0;
        #10 ci=1;
        #10 ci=0;
        #10 ci=1;
        #10 ci=0;
        #10 ci=1;
    end
endmodule
