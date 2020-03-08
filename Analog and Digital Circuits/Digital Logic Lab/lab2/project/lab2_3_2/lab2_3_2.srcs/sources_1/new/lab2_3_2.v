`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/18 23:49:40
// Design Name: 
// Module Name: lab2_3_2
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

module lab2_3_2(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [6:0] seg,
    output [7:0] an,
    output z
    );
    wire [2:0] co;
    wire [3:0] s;
    wire cout;
    wire [3:0] x;
    wire [3:0] t;
    
    fulladder_dataflow(a[0],b[0],cin,s[0],co[0]);
    fulladder_dataflow(a[1],b[1],co[0],s[1],co[1]);
    fulladder_dataflow(a[2],b[2],co[1],s[2],co[2]);
    fulladder_dataflow(a[3],b[3],co[2],s[3],cout);
    
    comparator(cout,s,z);
    lab3_circuitA(cout,s,t);
    
    mux_2to1(s[3],t[3],z,x[3]);
    mux_2to1(s[2],t[2],z,x[2]);
    mux_2to1(s[1],t[1],z,x[1]);
    mux_2to1(s[0],t[0],z,x[0]);
    bcdto7(x,an,seg);
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

module comparator(
    input cout,
    input [3:0] v,
    output z
    );
    
    assign z = cout | (v[3] & (v[2] | v[1]));
endmodule

module lab3_circuitA(
    input cout,
    input [3:0] s,
    output [3:0] x
    );
    
    assign x[3]=cout&(~s[3]&~s[2]&s[1]&~s[0] | ~s[3]&~s[2]&s[1]&s[0]);
    assign x[2]=~cout&(s[3]&s[2]&s[1]&~s[0] | s[3]&s[2]&s[1]&s[0]) | cout&(~s[3]&~s[2]&~s[1]&~s[0] | ~s[3]&~s[2]&~s[1]&s[0]);
    assign x[1]=~cout&(s[3]&s[2]&~s[1]&~s[0] | s[3]&s[2]&~s[1]&s[0]) | cout&(~s[3]&~s[2]&~s[1]&~s[0] | ~s[3]&~s[2]&~s[1]&s[0]);
    assign x[0]=s[0];
endmodule

module mux_2to1(
    input x,
    input y,
    input s,
    output m
    );
    wire a,b,snot;
    
    not(snot,s);
    and(a,x,snot);
    and(b,y,s);
    or(m,a,b);
endmodule

module bcdto7(
    input [3:0] x,
    output [7:0] an,
    output [6:0] seg
    );
    
        assign an=8'b11111110;
        assign seg[0] = (~x[3] & x[2]&~x[1]&~x[0]) | (~x[3] & ~x[2] & ~x[1] & x[0]);
        assign seg[1] = (~x[3] & x[2] & x[1] & ~x[0]) | (~x[3] & x[2] & ~x[1] & x[0]);
        assign seg[2] = ~x[3] & ~x[2] & x[1] & ~x[0];
        assign seg[3] = (~x[3] & ~x[2] & ~x[1] & x[0]) | (~x[3] & x[2] & ~x[1] & ~x[0]) | (~x[3] & x[2] & x[1] & x[0]);
        assign seg[4] = x[0] | (~x[3] & x[2] & ~x[1]);
        assign seg[5] = (x[1] & x[0]) | (~x[3] & ~x[2] & x[1]) | (~x[3] & ~x[2] & x[0]);
        assign seg[6] = (~x[3] & ~x[2] & ~x[1])| (x[2] & x[1] & x[0]);
endmodule
