`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/20 09:42:59
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [3:0]s,
    input [31:0]a,
    input [31:0]b,
    output reg [31:0]y,
    output reg zero
    );
    parameter ADD = 4'b0010;
    parameter SUB = 4'b0110;
    parameter AND = 4'b0000;
    parameter OR = 4'b0001;
    parameter NOR = 4'b1100;
    parameter XOR = 4'b0011;
    parameter SLT = 4'b0111;
    always @(*)
    begin
        case(s)
            ADD:y = a + b;
            SUB:y = a - b;
            AND:begin y = a & b;end
            OR:begin y = a | b;end
            NOR:begin y = ~(a|b);end
            XOR:begin y = a^b;end
            SLT:begin y=(a[31]&~b[31])|(a[31]&b[31]&(a>b))|(~a[31]&~b[31]&(a<b));end
            default: y = 0;
        endcase
        
        if(y == 0) zero = 1;
        else zero = 0;

    end
endmodule
