`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/21 20:27:58
// Design Name: 
// Module Name: lab_1_3_3_tb
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


module lab_1_3_3_tb(
    );
    reg [3:0]a;
    reg [3:0]b;
    reg rst,clk;
    wire [15:0]y;
    
    lab1_3_3 DUT(.a(a),.b(b),.rst(rst),.clk(clk),.y(y));
    
    initial
    begin
      clk=0;
        forever #5 clk=~clk;
    end
    
    initial
    begin
        a=4'd1;
        b=4'd1;
    end
    
    initial
    begin
      rst=1;
        #13 rst=0;
        #100 rst=1;
        #10 rst=0;
    end
endmodule
