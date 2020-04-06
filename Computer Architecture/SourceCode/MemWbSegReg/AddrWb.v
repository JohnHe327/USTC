`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
//           John He (hechunwang2000327@hotmail.com)
// Design Name: Addr_WB
// Module Name: Register Address seg reg
// Tool Versions: Vivado 2017.4.1
// Description: Register address seg reg for MEM\WB
// 
//////////////////////////////////////////////////////////////////////////////////


//  功能说明
    // MEM\WB的寄存器地址段寄存器，包括两个源寄存器和一个目标寄存器的地址
// 输入
    // clk               时钟信号
    // reg_dest_MEM      MEM阶段的目标寄存器地址
    // csr_dest_MEM      MEM阶段的目标CSR地址
    // bubbleW           WB阶段的bubble信号
    // flushW            WB阶段的flush信号
// 输出
    // reg_dest_WB       传给下一流水段的目标寄存器地址
    // csr_dest_WB       传给下一流水段的目标CSR地址
// 实验要求  
    // 添加CSR

module Addr_WB(
    input wire clk, bubbleW, flushW,
    input wire [4:0] reg_dest_MEM,
    input wire [11:0] csr_dest_MEM,
    output reg [4:0] reg_dest_WB,
    output reg [11:0] csr_dest_WB
    );

    initial 
    begin
        reg_dest_WB = 4'h0;
        csr_dest_WB = 12'h0;
    end

    always@(posedge clk)
        if (!bubbleW) 
        begin
            if (flushW)
            begin
                reg_dest_WB <= 4'h0;
                csr_dest_WB <= 12'h0;
            end
            else 
            begin
                reg_dest_WB <= reg_dest_MEM;
                csr_dest_WB <= csr_dest_MEM;
            end
        end
    
endmodule
