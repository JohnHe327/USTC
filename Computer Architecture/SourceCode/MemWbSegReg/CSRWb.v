`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: John He (hechunwang2000327@hotmail.com)
// 
// Design Name: RV32I Core
// Module Name: CSR data Seg Reg
// Tool Versions: Vivado 2017.4.1
// Description: CSR data Seg Reg for MEM\WB
// 
//////////////////////////////////////////////////////////////////////////////////


//  功能说明
    // MEM\WB的CSR段寄存器
// 输入
    // clk               时钟信号
    // csr_wb_MEM        写回CSR的内容
    // bubbleW           WB阶段的bubble信号
    // flushW            WB阶段的flush信号
// 输出
    // csr_wb_WB         传给下一流水段写回CSR的内容


module CSR_WB(
    input wire clk, bubbleW, flushW,
    input wire [31:0] csr_wb_MEM,
    output reg [31:0] csr_wb_WB
    );

    initial csr_wb_WB = 0;
    
    always@(posedge clk)
        if (!bubbleW) 
        begin
            if (flushW)
                csr_wb_WB <= 0;
            else 
                csr_wb_WB <= csr_wb_MEM;
        end
    
endmodule
