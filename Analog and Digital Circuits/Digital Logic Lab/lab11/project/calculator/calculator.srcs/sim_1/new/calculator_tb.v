`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 11:18:43
// Design Name: 
// Module Name: calculator_tb
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


module calculator_tb(
    );
    reg [7:0]in1,in2;
    reg add,sub,mul,div,clear,CLK100MHZ;
    wire [3:0]ANin,ANout;
    wire [7:0]seg;
    wire [15:0]result;
    calculator DUT(in1,in2,add,sub,mul,div,clear,CLK100MHZ,ANin,ANout,seg,result);
    
    initial
    begin
      CLK100MHZ=0;
        forever
        begin
        #1 CLK100MHZ=1;
        #1 CLK100MHZ=0;
        end
    end
    
    initial
    begin
      clear=1;
        #1 clear=0;
        
    end
    
    initial
    begin
      in1=8'd0;
    end
    
    initial
    begin
      in2=8'd0;
    end
    
    initial
    begin
      add=0;
    end
    
    initial
    begin
      sub=0;
    end
    
    initial
    begin
      mul=0;
    end
    
    initial
    begin
      div=0;
    end
endmodule
