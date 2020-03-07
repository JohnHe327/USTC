`timescale 1ns / 1ps

module CPU_tb(
    );
    reg clk,rst,cont,step,mem,inc,dec;
    wire [15:0] led;
    wire [7:0] an;
    wire [6:0] seg;
    MIPS32_multi DUT (clk,rst,cont,step,mem,inc,dec,led,an,seg);
    initial begin
      clk=0;
        forever #5 clk=~clk;
    end
    initial begin
     rst=0;
        #2 rst=1;
        #5 rst=0;
    end
    initial #3 cont=1;
    initial step=0;
    initial begin
      mem=0;
        forever #5 mem=~mem;
    end
    initial begin
      inc=0;
        forever #5 inc=~inc;
    end
    initial dec=0;
endmodule