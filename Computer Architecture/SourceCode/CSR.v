`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: John He (hechunwang2000327@hotmail.com)
// 
// Design Name: RV32I Core
// Module Name: CSR
// Tool Versions: Vivado 2017.4.1
// Description: CSR File
// 
//////////////////////////////////////////////////////////////////////////////////


//  功能说明
    //  SYSTEM CSR模块
// 输入
    // clk               时钟信号
    // rst               重置信号
    // write_en          写使能
    // read_en           读使能
    // addr              读地址
    // wb_addr           写回地址
    // wb_data           写回数据
// 输出
    // csr_data          读数据
// 实验要求
    // 添加模块


module CSR(
    input wire clk,
    input wire rst,
    input wire write_en,
    input wire read_en,
    input wire [11:0] addr, wb_addr,
    input wire [31:0] wb_data,
    output wire [31:0] csr_data
    );

    wire [4:0] dealt_addr, dealt_wb_addr;
    assign dealt_addr = addr[4:0];
    assign dealt_wb_addr = wb_addr[4:0];

    reg [31:0] csr_file[31:0];
    integer i;

    //init csr file
    initial
    begin
        for (i = 0; i < 32; i = i + 1)
            csr_file[i][31:0] <= 32'b0;
    end

    // write data
    always@(negedge clk or posedge rst)
    begin
        if (rst)
            for (i = 0; i < 32; i = i + 1)
                csr_file[i][31:0] <= 32'b0;
        else if (write_en)
            csr_file[dealt_wb_addr] <= wb_data;
    end

    // read data
    assign csr_data = (read_en) ? csr_file[dealt_addr] : 32'b0;

endmodule
