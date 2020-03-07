`timescale 1ns / 1ps

module PCU(
    input clk50,
    input rst,
    input [11:0] rgb,
    input up,down,left,right,
    input draw,
    output we,
    output [11:0] pdata,
    output [15:0] paddr,
    output reg [7:0]x,y
    );
    always @ (posedge clk50 or posedge rst) begin
        if(rst) begin
            x <= 128;
            y <= 128;
        end
        else begin
            case({up,down,left,right})
            4'b1000: begin
                y <= y - 1;
            end
            4'b0100: begin
                y <= y + 1;
            end
            4'b0010: begin
                x <= x - 1;
            end
            4'b0001: begin
                x <= x + 1;
            end
            4'b1010: begin
                x <= x - 1; y <= y - 1;
            end
            4'b1001: begin
                x <= x + 1; y <= y - 1;
            end
            4'b0110: begin
                x <= x - 1; y <= y + 1;
            end
            4'b0101: begin
                x <= x + 1; y <= y + 1;
            end
            endcase
        end
    end
    
    assign paddr = 256 * x + y;
    assign we = draw;
    assign pdata = rgb;
endmodule
