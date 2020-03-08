`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 22:36:48
// Design Name: 
// Module Name: lab6_2_1
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


module lab6_2_1(
    input Clk,
    input CLR,
    input En,
    output [7:0]Q
    );
    wire [7:0] en;
    and A0(en[0],En,1);    TFF T0(Clk,en[0],CLR,Q[0],Q[0]);
    and A1(en[1],en[0],Q[0]);    TFF T1(Clk,en[1],CLR,Q[1],Q[1]);
    and A2(en[2],en[1],Q[1]);    TFF T2(Clk,en[2],CLR,Q[2],Q[2]);
    and A3(en[3],en[2],Q[2]);    TFF T3(Clk,en[3],CLR,Q[3],Q[3]);
    and A4(en[4],en[3],Q[3]);    TFF T4(Clk,en[4],CLR,Q[4],Q[4]);
    and A5(en[5],en[4],Q[4]);    TFF T5(Clk,en[5],CLR,Q[5],Q[5]);
    and A6(en[6],en[5],Q[5]);    TFF T6(Clk,en[6],CLR,Q[6],Q[6]);
    and A7(en[7],en[6],Q[6]);    TFF T7(Clk,en[7],CLR,Q[7],Q[7]);
endmodule

module TFF(
    input Clk,
    input En,
    input CLR,
    input Qin,
    output reg Qout
    );
    
    always @(posedge Clk or negedge CLR)
    if(~CLR)
        Qout<=0;
    else if(En)
        Qout<=~Qin;
    
endmodule