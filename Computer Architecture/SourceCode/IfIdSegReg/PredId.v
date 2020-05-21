`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: John He (hechunwang2000327@hotmail.com)
// 
// Design Name: RV32I Core
// Module Name: Prediction ID Seg Reg
// Tool Versions: Vivado 2017.4.1
// Description: Prediction seg reg for IF\ID
// 
//////////////////////////////////////////////////////////////////////////////////


//  功能说明
    // IF\ID的Prediction段寄存器
// 输入
    // clk               时钟信号
    // PRED_TAKEN_IF     BTB传来的预测结果
    // bubbleD           ID阶段的bubble信号
    // flushD            ID阶段的flush信号
// 输出
    // PRED_TAKEN_ID     传给下一段寄存器的预测结果

module PRED_ID(
    input wire clk, bubbleD, flushD,
    input wire [31:0] PRED_TAKEN_IF,
    output reg [31:0] PRED_TAKEN_ID
    );

    initial PRED_TAKEN_ID = 0;
    
    always@(posedge clk)
        if (!bubbleD) 
        begin
            if (flushD)
                PRED_TAKEN_ID <= 0;
            else 
                PRED_TAKEN_ID <= PRED_TAKEN_IF;
        end
    
endmodule
