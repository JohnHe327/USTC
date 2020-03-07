`timescale 1ns / 1ps

module Counter(
    input [14:0]d,
    input pe,ce,rst,
    input CLK100MHZ,
    output reg [14:0] q,
    output clk1
    );
    wire clk500;
    clock C(CLK100MHZ,clk500,clk1);
    always @(posedge clk1 or posedge rst)
    begin
        if(rst) q=0;
        else if(pe) q=d;
        else if(ce) q=q+1;
    end
endmodule
