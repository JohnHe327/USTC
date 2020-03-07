`timescale 1ns / 1ps

module DReg(
    input clk,rst,
    input [31:0]in,
    input en,
    output reg [31:0]out
    );
    always @ (posedge clk,posedge rst)
    begin
        if(rst) out <= 32'bx;
        else if(en)out <= in;
        else out <= out;
    end
endmodule