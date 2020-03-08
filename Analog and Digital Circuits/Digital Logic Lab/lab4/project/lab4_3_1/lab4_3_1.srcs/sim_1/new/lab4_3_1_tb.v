`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/01 22:08:51
// Design Name: 
// Module Name: rca_tb
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


module rca_tb(
    );
    reg [3:0]x;
    reg [3:0]y;
    reg CIN;
    wire [3:0]sum;
    wire cout;
    reg [3:0]SUM;
    reg COUT;
    
    integer i;
    
    rca UUT(.a(x),.b(y),.cin(CIN),.s(sum),.cout(cout));
    function [4:0]exp_result;
        input [3:0]m;
        input [3:0]n;
        input c;
        exp_result=m+n+c;
    endfunction
    
    initial
    begin
        for(i=0;i<511;i=i+1)
        begin
            #40 {x,y,CIN}=i;
            #10 {COUT,SUM}=exp_result(x,y,CIN);
            if({COUT,SUM}=={cout,sum})
                $display("SUM match at ",$time);
            else
                $display("COUT/SUM mis-match at ",$time,":expected: %b%b, actual:%b%b",COUT,SUM,cout,sum);
        end
    end
endmodule
