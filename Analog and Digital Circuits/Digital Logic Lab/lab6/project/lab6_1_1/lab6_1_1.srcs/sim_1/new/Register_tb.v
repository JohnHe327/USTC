`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 19:43:58
// Design Name: 
// Module Name: Register_tb
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


module Register_tb(
    );
    reg Clk,load,reset;
    reg [3:0]D;
    wire [3:0]Q;
    
    Register DUT (.D(D),.Q(Q),.Clk(Clk),.load(load),.reset(reset));
    
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
      load=0;
        #60 load=1;
        #20 load=0;
        #40 load=1;
        #20 load=0;
        #55 load=1;
        #20 load=0;
        #65 load=1;
    end
    
    initial
    begin
      reset=0;
        #155 reset=1;
        #85 reset=0;
    end
    
    initial
    begin
      D=4'b0000;
        #20 D=4'b0101;
        #60 D=4'b1001;
    end
endmodule
