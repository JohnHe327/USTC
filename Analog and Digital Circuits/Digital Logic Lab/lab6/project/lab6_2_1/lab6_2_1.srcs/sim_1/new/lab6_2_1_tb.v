`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 22:41:15
// Design Name: 
// Module Name: lab6_2_1_tb
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


module lab6_2_1_tb(
    );
    reg Clk,CLR,En;
    wire [7:0]Q;
    
    lab6_2_1 DUT (.Clk(Clk),.En(En),.CLR(CLR),.Q(Q));
    initial
    begin
      Clk=0;
        forever
        begin
        #5 Clk=1;
        #5 Clk=0;
        end
    end
    
    initial
    begin
      CLR=0;
        #40 CLR=1;
    end
    
    initial
    begin
      En=0;
        #20 En=1;
        #100 En=0;
        #80 En=1;
    end
    
endmodule
