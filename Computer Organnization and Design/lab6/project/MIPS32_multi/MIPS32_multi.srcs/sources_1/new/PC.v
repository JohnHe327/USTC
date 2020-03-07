`timescale 1ns / 1ps

module PC(
    input clk,rst,en,
    input [31:0]PCin,
    output reg [31:0]PCout
    );
    always @ (posedge clk, posedge rst)
    begin
        if(rst) PCout <= 0;
        else if(en) PCout <= PCin;
        else PCout <= PCout;
    end
endmodule