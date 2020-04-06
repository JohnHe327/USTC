`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: John He (hechunwang2000327@hotmail.com)
// 
// Design Name: RV32I Core
// Module Name: CSR data Seg Reg
// Tool Versions: Vivado 2017.4.1
// Description: CSR data Seg Reg for EX\MEM
// 
//////////////////////////////////////////////////////////////////////////////////


//  功能说明
    // EX\MEM的CSR段寄存器
// 输入
    // clk               时钟信号
    // csr_data_EX       CSR的内容
    // bubbleM           MEM阶段的bubble信号
    // flushM            MEM阶段的flush信号
// 输出
    // csr_data_MEM      传给下一流水段的CSR内容


module CSR_MEM(
    input wire clk, bubbleM, flushM,
    input wire [31:0] csr_data_EX,
    output reg [31:0] csr_data_MEM
    );

    initial csr_data_MEM = 0;
    
    always@(posedge clk)
        if (!bubbleM) 
        begin
            if (flushM)
                csr_data_MEM <= 0;
            else 
                csr_data_MEM <= csr_data_EX;
        end
    
endmodule
