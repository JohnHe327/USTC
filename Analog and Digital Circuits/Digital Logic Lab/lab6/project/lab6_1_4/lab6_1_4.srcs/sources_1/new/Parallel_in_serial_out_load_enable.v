`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 20:52:22
// Design Name: 
// Module Name: Parallel_in_serial_out_load_enable
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


module Parallel_in_serial_out_load_enable(
    input Clk,
    input In,
    input [3:0] ParaIn,
    input load,
    input En,
    output Out,
    output [3:0] RegCont
    );
    reg [3:0] shift_reg;
    
    always@(posedge Clk)
    begin
        if(load)
            shift_reg<=ParaIn;
        else if(En)
            shift_reg<={shift_reg[2:0],In};
    end
    assign RegCont=shift_reg;
    assign Out=shift_reg[3];
endmodule
