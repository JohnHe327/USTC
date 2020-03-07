`timescale 1ns / 1ps

module MIPS32_multi(
    input clk,rst,
    input cont,step,mem,inc,dec,
    output [15:0]led,
    output [7:0]an,
    output [6:0]seg
    );
    wire run;
    wire [7:0]addr;
    wire [31:0]mem_data,reg_data;
    wire [31:0]PC;
    CPU C(clk,rst,run,addr,mem_data,reg_data,PC);
    DDU D(clk,cont,step,mem,inc,dec,PC[9:2],mem_data,reg_data,addr,run,led,an,seg);
endmodule
