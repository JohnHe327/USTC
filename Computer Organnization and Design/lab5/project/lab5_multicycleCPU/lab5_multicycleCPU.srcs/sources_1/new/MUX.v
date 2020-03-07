`timescale 1ns / 1ps

module MUX2to1(
    input [31:0]in0,in1,
    input s,
    output [31:0]out
    );
    assign out = s ? in1:in0;
endmodule

module MUX3to1(
    input [31:0]in0,in1,in2,
    input [1:0]s,
    output reg [31:0]out
    );
    always @ (*)
    begin
        case(s)
            2'b00:out = in0;
            2'b01:out = in1;
            2'b10:out = in2;
            default: out = 32'bx;
        endcase
    end
endmodule

module MUX4to1(
    input [31:0]in0,in1,in2,in3,
    input [1:0]s,
    output reg [31:0]out
    );
    always @ (*)
    begin
        case(s)
            2'b00:out = in0;
            2'b01:out = in1;
            2'b10:out = in2;
            2'b11:out = in3;
        endcase
    end
endmodule