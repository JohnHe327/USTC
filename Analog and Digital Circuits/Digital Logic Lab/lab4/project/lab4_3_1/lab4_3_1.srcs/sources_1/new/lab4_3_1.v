`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/01 21:58:35
// Design Name: 
// Module Name: rca_dataflow
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


module rca(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
    );
    wire [2:0] co;
    
    fulladder_dataflow U1(a[0],b[0],cin,s[0],co[0]);
    fulladder_dataflow U2(a[1],b[1],co[0],s[1],co[1]);
    fulladder_dataflow U3(a[2],b[2],co[1],s[2],co[2]);
    fulladder_dataflow U4(a[3],b[3],co[2],s[3],cout);
    
endmodule

module fulladder_dataflow(
    input a,
    input b,
    input cin,
    output reg s,
    output reg cout
    );
    
    always @ *
    #2 {cout,s}=a+b+cin;
endmodule