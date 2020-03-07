`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/05 16:59:42
// Design Name: 
// Module Name: SegDisplay
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SegDisplay(
    input [31:0]data,
    input clk,
    output reg [6:0]seg,
    output reg [7:0]an
    );
    reg [3:0] cur_data;
        always @ (data,an) begin
            case (an)
                8'b01111111:cur_data=data[31:28];
                8'b10111111:cur_data=data[27:24];
                8'b11011111:cur_data=data[23:20];
                8'b11101111:cur_data=data[19:16];
                8'b11110111:cur_data=data[15:12];
                8'b11111011:cur_data=data[11:8];
                8'b11111101:cur_data=data[7:4];
                8'b11111110:cur_data=data[3:0];
                default:cur_data=4'b0000;
            endcase
        end
        always @ (cur_data) begin
            case (cur_data)////////gfedcba
                4'b0000:seg=7'b1000000;//0
                4'b0001:seg=7'b1111001;//1
                4'b0010:seg=7'b0100100;//2
                4'b0011:seg=7'b0110000;//3
                4'b0100:seg=7'b0011001;//4
                4'b0101:seg=7'b0010010;//5
                4'b0110:seg=7'b0000010;//6
                4'b0111:seg=7'b1111000;//7
                4'b1000:seg=7'b0000000;//8
                4'b1001:seg=7'b0010000;//9
                4'b1010:seg=7'b0001000;//A
                4'b1011:seg=7'b0000011;//b
                4'b1100:seg=7'b1000110;//C
                4'b1101:seg=7'b0100001;//d
                4'b1110:seg=7'b0000110;//E
                4'b1111:seg=7'b0001110;//F
            endcase
        end
        initial an=8'b01111111;
        always @ (posedge clk) begin
            an={1'b1,an[7:1]};
            if (&an) an=8'b01111111;
        end
endmodule
