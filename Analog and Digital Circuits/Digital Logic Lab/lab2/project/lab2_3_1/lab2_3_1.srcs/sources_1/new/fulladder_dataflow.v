`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/18 23:00:18
// Design Name: 
// Module Name: fulladder_dataflow
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

module rca_dataflow(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
    );
    wire [2:0] co;
    
    fulladder_dataflow(a[0],b[0],cin,s[0],co[0]);
    fulladder_dataflow(a[1],b[1],co[0],s[1],co[1]);
    fulladder_dataflow(a[2],b[2],co[1],s[2],co[2]);
    fulladder_dataflow(a[3],b[3],co[2],s[3],cout);
    
endmodule



module fulladder_dataflow(
    input a,
    input b,
    input cin,
    output s,
    output cout
    );
    
    assign s=a^b^cin;
    assign cout=a&b&cin | ~a&b&cin | a&~b&cin | a&b&~cin;
endmodule
