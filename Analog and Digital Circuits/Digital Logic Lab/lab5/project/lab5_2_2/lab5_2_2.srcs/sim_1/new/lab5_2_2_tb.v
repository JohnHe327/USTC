`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/02 14:21:58
// Design Name: 
// Module Name: lab5_2_2_tb
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


module lab5_2_2_tb(
    );
    reg Clk,D,S;
    wire Qa,Qb,Qc,Qd;
    lab5_2_2 DUT (D,Clk,S,Qa,Qb,Qc,Qd);
    initial
    begin
      Clk=0;
        forever
        begin
            #10 Clk=1;
            #10 Clk=0;
        end
    end
    
    initial
    begin
      D=0;
        #8 D=1;
        #4 D=0;
        #2 D=1;
        #3 D=0;
        #5 D=1;
        #3 D=0;
        #1 D=1;
        #2 D=0;
        #4 D=1;
        #1 D=0;
        #2 D=1;
        #7 D=0;
    end
    
    initial
    begin
      S=0;
        #15 S=1;
        #10 S=0;
        #10 S=1;
        #10 S=0;
    end
endmodule
