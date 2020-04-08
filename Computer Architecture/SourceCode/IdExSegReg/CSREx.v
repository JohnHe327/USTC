`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: John He (hechunwang2000327@hotmail.com)
// 
// Design Name: RV32I Core
// Module Name: CSR data Seg Reg
// Tool Versions: Vivado 2017.4.1
// Description: CSR data Seg Reg for ID\EX
// 
//////////////////////////////////////////////////////////////////////////////////


//  功能说明
    // ID\EX的CSR段寄存器
// 输入
    // clk               时钟信号
    // csr_data          CSR读取的内容
    // bubbleE           EX阶段的bubble信号
    // flushE            EX阶段的flush信号
// 输出
    // csr_data_EX       传给下一流水段的CSR内容


module CSR_EX(
    input wire clk, bubbleE, flushE,
    input wire [31:0] csr_data,
    output reg [31:0] csr_data_EX
    );

    initial csr_data_EX = 0;
    
    always@(posedge clk)
        if (!bubbleE) 
        begin
            if (flushE)
                csr_data_EX <= 0;
            else 
                csr_data_EX <= csr_data;
        end
    
endmodule
