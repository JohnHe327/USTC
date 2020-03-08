`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/30 15:22:10
// Design Name: 
// Module Name: lab10_2_1_tb
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


module lab10_2_1_tb(
    );
    reg Clk,rst;
    reg [1:0]ain;
    wire yout;
    lab10_2_1 DUT(Clk,rst,ain,yout);
    
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
      rst=1;
        #20 rst=0;
        #150 rst=1;
        #10 rst=0;
    end
    
    initial
    begin
      ain=2'b00;
      #40 ain=2'b11;
      #10 ain=2'b10;
      #10 ain=2'b00;
      #20 ain=2'b10;
      #10 ain=2'b00;
      #10 ain=2'b11;
      #10 ain=2'b00;
      #10 ain=2'b01;
      #10 ain=2'b00;
      #10 ain=2'b10;
      #10 ain=2'b11;
      #10 ain=2'b00;
      #30 ain=2'b10;
      #30 ain=2'b00;
    end
endmodule
