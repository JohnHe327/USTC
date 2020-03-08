`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/02 00:38:11
// Design Name: 
// Module Name: lab5_1_2_tb
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


module lab5_1_2_tb(
    );
    reg R,S,E;
    wire Q,Qbar;
    lab5_1_2 DUT (.R(R),.S(S),.E(E),.Q(Q),.Qbar(Qbar));
    initial
    begin
      S=0;R=0;E=0;
        #10 S=1;
        #10 E=1;
        #10 S=0;
        #10 R=1;
        #10 E=0;
        #10 S=1;R=0;
        #10 R=1;S=0;
        #10 S=1;R=0;
        #10 E=1;
        #10 ;
    end
endmodule
