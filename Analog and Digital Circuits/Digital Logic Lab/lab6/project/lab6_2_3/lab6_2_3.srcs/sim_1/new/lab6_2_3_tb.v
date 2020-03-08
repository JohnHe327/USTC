`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/09 14:15:38
// Design Name: 
// Module Name: lab6_2_3_tb
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


module lab6_2_3_tb(
    );
    reg Clk,load,CLR,En;
    wire [3:0]Q;
    
    lab6_2_3 DUT (.Clk(Clk),.load(load),.CLR(CLR),.En(En),.Q(Q));
    
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
      En=0;
        #20 En=1;
        #150 En=0;
        #40 En=1;
    end
    
    initial
    begin
      CLR=0;
        #40 CLR=1;
        #20 CLR=0;
    end
    
    initial
    begin
      load=0;
        #80 load=1;
        #10 load=0;
    end
endmodule
