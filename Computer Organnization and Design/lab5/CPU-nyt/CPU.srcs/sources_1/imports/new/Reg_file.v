`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 21:43:47
// Design Name: 
// Module Name: Reg_file
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


module Reg_file #(parameter DATA=32,parameter ADDR=5,parameter NUM=32)(
    input rst,clk,
    input [ADDR-1:0]ra0,ra1,ra2,
    input [ADDR-1:0]wa,
    input we,
    input [DATA-1:0]wd,
    output [DATA-1:0]rd0,rd1,rd2
    );
        genvar k;
    reg [DATA-1:0] regs [NUM-1:0];
    assign rd1=regs[ra1];
    assign rd0=regs[ra0];
    assign rd2=regs[ra2];
    initial begin
        regs[0]=0;//$zero register
    end
    generate
        for (k=1;k<(1<<ADDR);k=k+1) begin:RegFileResetAndSet
            always @ (posedge clk,posedge rst)
                if (rst) regs[k]<=0;
                else if (we&&wa==k) regs[k]<=wd;
                else regs[k]<=regs[k];
        end
    endgenerate
    
endmodule