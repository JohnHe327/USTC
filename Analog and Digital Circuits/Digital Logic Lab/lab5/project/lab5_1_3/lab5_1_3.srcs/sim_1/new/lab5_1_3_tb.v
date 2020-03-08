`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/02 12:22:19
// Design Name: 
// Module Name: lab5_1_3_tb
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


module lab5_1_3_tb(
    );
    reg D,E;
    wire Q,Qbar;
    D_latch DUT(.D(D),.E(E),.Q(Q),.Qbar(Qbar));
    initial
    begin
      D=0;E=0;
        #10 D=1;
        #10 E=1;
        #10 D=0;
        #10 D=1;
        #10 E=0;
        #10 D=0;
        #10 D=1;
        #10 D=0;
        #10 E=1;
        #10 D=1;
        #10 D=0;
    end
    
endmodule
