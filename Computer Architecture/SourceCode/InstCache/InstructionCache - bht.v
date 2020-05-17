`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Instruction Cache
// Tool Versions: Vivado 2017.4.1
// Description: RV32I Instruction Cache
// 
//////////////////////////////////////////////////////////////////////////////////


//  功能说明
    //  同步读写读Cache，实验中可以将其当做只读Cache
    //  debug端口用于simulation时批量读写指令，可以忽略
// 输入
    // clk               时钟
    // write_en          debug写使能
    // addr              读地址
    // debug_addr        debug读写地址
    // debug_input       debug写指令
// 输出
    // data              读的指令
    // debug_data        debug读的指令
// 实验要求  
    // 无需修改

// asm file name: bht.S

module InstructionCache(
    input wire clk,
    input wire write_en,
    input wire [31:2] addr, debug_addr,
    input wire [31:0] debug_input,
    output reg [31:0] data, debug_data
);

    // local variable
    wire addr_valid = (addr[31:14] == 18'h0);
    wire debug_addr_valid = (debug_addr[31:14] == 18'h0);
    wire [11:0] dealt_addr = addr[13:2];
    wire [11:0] dealt_debug_addr = debug_addr[13:2];
    // cache content
    reg [31:0] inst_cache[0:4095];


    initial begin
        data = 32'h0;
        debug_data = 32'h0;
        inst_cache[       0] = 32'h00000293;
        inst_cache[       1] = 32'h00000313;
        inst_cache[       2] = 32'h00000393;
        inst_cache[       3] = 32'h00a00e13;
        inst_cache[       4] = 32'h00138393;
        inst_cache[       5] = 32'h00530333;
        inst_cache[       6] = 32'h00128293;
        inst_cache[       7] = 32'hffc29ce3;
        inst_cache[       8] = 32'h00000293;
        inst_cache[       9] = 32'hffc396e3;
        inst_cache[      10] = 32'h00130313;
end

    always@(posedge clk)
    begin
        data <= addr_valid ? inst_cache[dealt_addr] : 32'h0;
        debug_data <= debug_addr_valid ? inst_cache[dealt_debug_addr] : 32'h0;
        if(write_en & debug_addr_valid) 
            inst_cache[dealt_debug_addr] <= debug_input;
    end

endmodule
