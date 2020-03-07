`timescale 1ns / 1ps

module DCU(
    input [7:0] x,y,
    input clk50M,
    input rst,
    input [11:0] vdata,
    output [15:0] vaddr,
    output reg [11:0] rgbo,
    output  hs,vs
    );
    reg [12:0] hcnt; reg [11:0]vcnt;
    wire ve;
    wire [11:0] vrgb;
    
    always @(posedge clk50M or posedge rst) begin
        if(rst) begin
            hcnt <= 0;
            vcnt <= 0;
        end
        else begin
            if(hcnt >= 1039) begin
                hcnt <= 0;
                if(vcnt >= 665) vcnt <= 0;
                else vcnt <= vcnt + 1;
            end
            else hcnt <= hcnt + 1;
        end
    end
    assign hs = (hcnt <= 583) || (hcnt >= 704);
    assign vs = (vcnt <= 464) || (vcnt >= 471);
    
    assign ve = (hcnt <= 255) && (vcnt <= 255);
    assign vaddr = ve * (256 * hcnt + vcnt);
    assign vrgb = ve * vdata;
    always @ * begin
        if(hcnt == x && (vcnt - y <= 3 || y - vcnt <= 3) || vcnt == y && (hcnt - x <= 3 || x - hcnt <= 3))
        rgbo = 12'hf00;
        else rgbo = vrgb;
    end
endmodule
