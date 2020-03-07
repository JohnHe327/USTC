`timescale 1ns / 1ps

module DispCtrl(
    input [11:0] color,
    input up,down,left,right,rst,
    input draw,
    input CLK100MHZ,
    output [11:0]vrgb,
    output hs,vs
    );
    wire clk50M,clk50;
    clock(CLK100MHZ,clk50M,clk50);
    
    wire we; wire [11:0] pdata; wire [15:0] paddr; wire [7:0] x,y;
    PCU(clk50,rst,color,up,down,left,right,draw,we,pdata,paddr,x,y);
    
    wire [15:0]vaddr; wire [11:0]vdata;
    dist_mem_gen_0(paddr,pdata,vaddr,clk50,we,vdata);
    DCU(x,y,clk50M,rst,vdata,vaddr,vrgb,hs,vs);
endmodule