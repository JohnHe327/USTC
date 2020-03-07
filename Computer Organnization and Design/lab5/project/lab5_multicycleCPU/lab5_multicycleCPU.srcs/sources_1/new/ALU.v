`timescale 1ns / 1ps

module ALU(
    input [3:0]s,
    input [31:0]a,
    input [31:0]b,
    output reg [31:0]y,
    output reg zero
    );
    parameter ADD = 4'b0010,SUB = 4'b0110,AND = 4'b0000,OR = 4'b0001,
              NOR = 4'b1100,XOR = 4'b0011,SLT = 4'b0111;
    always @*
    begin
        case(s)
            ADD:y = a + b;
            SUB:y = a - b;
            AND:y = a & b;
            OR:y = a | b;
            NOR:y = ~(a|b);
            XOR:y = a^b;
            SLT:y=(a[31]&~b[31])|(a[31]&b[31]&(a>b))|(~a[31]&~b[31]&(a<b));
            default: y = 0;
        endcase
        
        zero = (y == 0);
    end
endmodule