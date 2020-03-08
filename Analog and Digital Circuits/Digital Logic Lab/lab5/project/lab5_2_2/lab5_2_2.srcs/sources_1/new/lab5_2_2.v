`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/02 14:13:42
// Design Name: 
// Module Name: lab5_2_2
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


module lab5_2_2(
    input D,
    input Clk,
    input S,
    output reg Qa,
    output reg Qb,
    output reg Qc,
    output reg Qd
    );
    
    always @ *
    begin
        if(Clk)
        Qa=D;
    end//DËø´æÆ÷
    
    always @(posedge Clk)
    begin
        Qb=D;//ÉÏÉý´¥·¢
    end
    
    always @(negedge Clk)
    begin
        Qc=D;//ÏÂ½µ´¥·¢
    end
    
    reg Qdbar,a,b;
    always @ *
    begin
        a=Clk&D;
        b=Clk&S;
        Qd=~(a|Qdbar);
        Qdbar=~(b|Qd);
    end
endmodule
