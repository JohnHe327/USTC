`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/21 19:33:20
// Design Name: 
// Module Name: lab1_1_tb
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


module lab1_1_tb(
    );
    reg [3:0]a;
    reg [3:0]b;
    reg [3:0]s;
    wire [3:0]y;
    wire [2:0]f;
    
    lab1_1 DUT(.a(a),.b(b),.s(s),.y(y),.f(f));
    initial
    begin
        a=4'b1010;
        b=4'b0111;
        s=4'b1111;
        #10 s=4'b0000;
        #10 s=4'b1000;
        #10 s=4'b0001;
        #10 s=4'b1001;
        #10 s=4'b0010;
        #10 s=4'b0011;
        #10 s=4'b0100;
        #10 s=4'b0101;
        #10 s=4'b1111;
    end
    
endmodule
