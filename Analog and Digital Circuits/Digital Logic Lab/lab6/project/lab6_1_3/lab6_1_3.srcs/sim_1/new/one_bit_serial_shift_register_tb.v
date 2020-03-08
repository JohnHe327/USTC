`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 20:36:06
// Design Name: 
// Module Name: one_bit_serial_shift_register_tb
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


module one_bit_serial_shift_register_tb(
    );
    reg Clk,In;
    wire Out;
    reg [4:0]shift;
    
    one_bit_serial_shift_register DUT (.Clk(Clk),.In(In),.Out(Out));
    
    initial
    begin
    Clk=0;
        forever
        begin
            #10 Clk=1;
            #10 Clk=0;
        end
    end
    
    initial
    begin
    In=0;
        #20 In=1;
        #40 In=0;
        #20 In=1;
        #40 In=0;
    end
endmodule
