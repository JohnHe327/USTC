`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/25 22:10:24
// Design Name: 
// Module Name: lab3_2_1
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


module lab3_2_1(
    input [7:0] v,
    input en_in,
    output reg [2:0] y,
    output reg en_out,
    output reg gs
    );
    
    always @ *
    begin
        if(en_in)
            {y,gs,en_out}=5'b11111;
        else
        begin
            if(&v)
                {y,gs,en_out}=5'b11110;
            else if(~v[7])
                {y,gs,en_out}=5'b00001;
            else if(v[7:6]==2'b10)
                {y,gs,en_out}=5'b00101;
            else if(v[7:5]==3'b110)
                {y,gs,en_out}=5'b01001;
            else if(v[7:4]==4'b1110)
                {y,gs,en_out}=5'b01101;
            else if(v[7:3]==5'b11110)
                {y,gs,en_out}=5'b10001;
            else if(v[7:2]==6'b111110)
                {y,gs,en_out}=5'b10101;
            else if(v[7:1]==7'b1111110)
                {y,gs,en_out}=5'b11001;
            else if(v==8'b11111110)
                {y,gs,en_out}=5'b11101;
        end
    end
endmodule
