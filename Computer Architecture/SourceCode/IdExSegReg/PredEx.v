`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: John He (hechunwang2000327@hotmail.com)
// 
// Design Name: RV32I Core
// Module Name: Prediction EX Seg Reg
// Tool Versions: Vivado 2017.4.1
// Description: Prediction seg reg for ID\EX
// 
//////////////////////////////////////////////////////////////////////////////////


//  功能说明
    // ID\EX的Prediction段寄存器
// 输入
    // clk               时钟信号
    // PRED_TAKEN_ID     Pred寄存器传来的预测结果
    // bubbleE           EX阶段的bubble信号
    // flushE            EX阶段的flush信号
// 输出
    // PRED_TAKEN_EX     传给下一流水段的预测结果

module PRED_EX(
    input wire clk, bubbleE, flushE,
    input wire [31:0] PRED_TAKEN_ID,
    output reg [31:0] PRED_TAKEN_EX
    );

    initial PRED_TAKEN_EX = 0;
    
    always@(posedge clk)
        if (!bubbleE) 
        begin
            if (flushE)
                PRED_TAKEN_EX <= 0;
            else 
                PRED_TAKEN_EX <= PRED_TAKEN_ID;
        end
    
endmodule
