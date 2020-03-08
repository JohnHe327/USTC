`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/02 13:35:55
// Design Name: 
// Module Name: lab5_2_1_tb
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


module lab5_2_1_tb(
    );
    reg Clk,D;
    wire Q;
    D_ff DUT (.D(D),.Clk(Clk),.Q(Q));
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
        #30 D=1;
        #30 D=0;
        #40 D=1;
        #20 D=0;
    end
endmodule
