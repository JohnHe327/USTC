`timescale 1ns / 1ps

module IReg(
    input clk,rst,
    input [31:0]IRin,
    input IRWrite,
    output reg [31:0]IR
    );
    always @ (posedge clk,posedge rst)
    begin
        if(rst) IR <= 32'bx;
        else if(IRWrite) IR <= IRin;
        else IR <= IR;
    end
endmodule