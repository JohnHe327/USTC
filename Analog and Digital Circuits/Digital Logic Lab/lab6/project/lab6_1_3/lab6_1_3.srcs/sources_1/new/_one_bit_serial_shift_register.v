`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 20:33:21
// Design Name: 
// Module Name: one_bit_serial_shift_register
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


module one_bit_serial_shift_register(
    input Clk,
    input In,
    output Out
    );
    reg [2:0]shift_reg;
    always @(posedge Clk)
        shift_reg<={shift_reg[1:0],In};
    assign Out=shift_reg[2];
endmodule
