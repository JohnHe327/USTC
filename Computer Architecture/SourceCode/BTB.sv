`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: John He (hechunwang2000327@hotmail.com)
// 
// Design Name: RV32I Core
// Module Name: Branch Target Bufffer
// Tool Versions: Vivado 2017.4.1
// Description: Branch Target Buffer for PC prediction
// 
//////////////////////////////////////////////////////////////////////////////////


//  功能说明
    // 动态分支预测
// 输入
    // clk               输入时钟
    // rst               CPU的rst信号
    // PC_IF             当前指令PC值
    // br_inst           EX段是否为branch指令
    // br                EX段br信号
    // PC_EX             EX段PC值
    // br_target         EX段br_target结果
    // PRED_TAKEN_EX     EX段预测结果
    //
    // BTB_EN            BTB 使能
    // BHT_EN            BHT 使能
    // BTB_LEN           BTB 项地址长度
    // BHT_LEN           BHT 项地址长度
// 输出
    // NPC_PRED          预测的下一PC值
    // PRED_TAKEN        是否预测跳转
// 实验要求  
    // 添加模块

module BTB #(
    parameter  BTB_EN        = 1, // BTB 使能
    parameter  BHT_EN        = 1, // BHT 使能
    parameter  BTB_LEN       = 3, // BTB 项地址长度
    parameter  BHT_LEN       = 12 // BHT 项地址长度
)(
    input wire clk, rst,
    input wire [31:0] PC_IF,
    output reg [31:0] NPC_PRED,
    output reg PRED_TAKEN,
    input wire br_inst,
    input wire br,
    input wire [31:0] PC_EX, br_target,
    input wire PRED_TAKEN_EX
);

localparam BTB_SIZE = 1 << BTB_LEN;
localparam BHT_SIZE = 1 << BHT_LEN;
localparam SN = 2'd0;
localparam WN = 2'd1;
localparam WT = 2'd2;
localparam ST = 2'd3; 

reg [          31:0] PC       [BTB_SIZE];   // PC of instruction fetch
reg [          31:0] PD       [BTB_SIZE];   // Predicted PC
reg                  TK       [BTB_SIZE];   // prediction state
reg [BTB_SIZE - 1:0] BTB_hit;               // current PC hit BTB

reg [           1:0] BHT_stat [BHT_SIZE];   // BHT table

wire [BHT_LEN - 1:0] BHT_target;            // BHT update target
assign BHT_target = PC_EX[BHT_LEN + 1:2];

// hit BTB buffer
always@(*) begin
    for (integer i = 0; i < BTB_SIZE; i++)
        if (PC[i] == PC_IF)
            BTB_hit[i] = 1'b1;
        else
            BTB_hit[i] = 1'b0;
end

integer hit_target;
initial hit_target = 0;
always@(*) begin
    for (integer i = 0; i < BTB_SIZE; i++)
        if (BTB_hit[i])
            hit_target = i;
end

// predict
always@(*) begin
    if (!BTB_EN) begin
        NPC_PRED = PC_IF + 4;
        PRED_TAKEN = 0;
    end else begin
        if (|BTB_hit && TK[hit_target]
            && (!BHT_EN || (BHT_stat[PC_IF[BHT_LEN + 1:2]] == ST) || (BHT_stat[PC_IF[BHT_LEN + 1:2]] == WT))) begin
            NPC_PRED = PD[hit_target];
            PRED_TAKEN = 1;
        end else begin
            NPC_PRED = PC_IF + 4;
            PRED_TAKEN = 0;
        end
    end
end

// record real result
integer record_target;
always@(*) begin
    integer i, j;
    for (i = 0; i < BTB_SIZE; i++)
        if (PC[i] == PC_EX)
            break;
    for (j = 0; j < BTB_SIZE; j++)
        if (TK[j] == 0)
            break;
    record_target = (i < BTB_SIZE) ? i :
                        ((j < BTB_SIZE) ? j :
                            (PC_EX / 4) % BTB_SIZE);
end

// update BTB buffer
always @ (posedge rst or negedge clk) begin
    if (rst) begin
        for (integer i = 0; i < BTB_SIZE; i++) begin
            PC[i] <= 32'b0;
            PD[i] <= 32'b0;
            TK[i] <= 0;
        end
    end else begin
        if (PC[record_target] == PC_EX) begin
            PD[record_target] <= br_target;
            TK[record_target] <= br;
        end else if (br) begin
            PC[record_target] <= PC_EX;
            PD[record_target] <= br_target;
            TK[record_target] <= br;
        end
    end
end

integer Tcnt, Fcnt;
// update BHT table
always @ (posedge rst or negedge clk) begin
    if (rst) begin
        for (integer i = 0; i < BHT_SIZE; i++)
            BHT_stat[i] <= WT;
        Tcnt <= 0;
        Fcnt <= 0;
    end else begin
        if (br_inst) begin
            case(BHT_stat[BHT_target])
                ST: BHT_stat[BHT_target] <= br ? ST : WT;
                WT: BHT_stat[BHT_target] <= br ? ST : SN;
                WN: BHT_stat[BHT_target] <= br ? ST : SN;
                SN: BHT_stat[BHT_target] <= br ? WN : SN;
                default: BHT_stat[BHT_target] <= WT;
            endcase
            if (br == PRED_TAKEN_EX)
                Tcnt <= Tcnt + 1;
            else
                Fcnt <= Fcnt + 1;
        end
    end
end

endmodule
