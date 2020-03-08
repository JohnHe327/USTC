`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/02 00:01:33
// Design Name: 
// Module Name: lab5_1_1_tb
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


module SR_latch_dataflow_tb(
    );
    reg S,R;
    wire Q,Qbar;
    SR_latch_dataflow  DUT (.S(S),.R(R),.Q(Q),.Qbar(Qbar));
    initial
    begin
      S=0;R=0;
        #10 S=1;
        #10 S=0;
        #10 R=1;
        #10 R=0;S=1;
        #10 R=1;S=0;
        #10 R=0;S=1;
        #10 R=1;S=0;
        #10 S=1;
        #10;
    end
endmodule
