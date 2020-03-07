`timescale 1ns / 1ps

module clock(
    input CLK100MHZ,
    output clk50M,
    output reg clk50
    );
    wire clk5M;
    clk_wiz_0 (clk50M,clk5M,CLK100MHZ);
    reg [15:0] cnt;
    always @ (posedge clk5M) begin
        if(cnt >= 49999) begin
            cnt <= 0;
            clk50 <= ~clk50;
        end
        else cnt <= cnt + 1;
    end
endmodule