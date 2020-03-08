`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/07 13:41:51
// Design Name: 
// Module Name: calculator
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


module calculator(
    input [7:0]in1,
    input [7:0]in2,
    input add,
    input sub,
    input mul,
    input div,
    input clear,
    input CLK100MHZ,
    output reg [3:0]ANin,
    output reg [3:0]ANout,
    output reg [7:0]seg,
    output reg [15:0]result
    );
    reg [15:0]IN1;
    always @ *
    begin
        if(in2==8'd0)
            IN1<=16'd0-16'd1;
        else
            IN1<=in1;
    end
    
    always @(posedge add or posedge sub or posedge mul or posedge div or posedge clear)
    begin
        if(clear==1) result=16'b0;
        else if (add==1)
            begin
            result=in1+in2;
            end
        else if (sub==1)
            begin
            if(in2>in1) result=in2-in1;
            else result=in1-in2;
            end
        else if (mul==1)
            begin
            result=in1*in2;
            end
        else if (div==1) result=IN1/in2;
    end
    
    wire clk500,clk1;
    clock C(CLK100MHZ,clk500,clk1);
    
    wire [7:0]segin0;
    wire [7:0]segin1;
    wire [7:0]segin2;
    wire [7:0]segin3;
    bitoseg b2sin(in1,in2,clk1,segin0,segin1,segin2,segin3);
    
    wire [7:0]segout0;
    wire [7:0]segout1;
    wire [7:0]segout2;
    wire [7:0]segout3;
    bi2seg_r b2sout(result,segout0,segout1,segout2,segout3);
    
    wire [2:0]Switch;
    SW sw(clk500,Switch);
    
    always @(posedge clk500)
    begin
        case(Switch)
        3'b000:
            begin
            seg=segout0;
            ANin=4'b1111;
            ANout=4'b1110;
            end
        3'b001:
            begin
            seg=segout1;
            ANin=4'b1111;
            ANout=4'b1101;
            end
        3'b0010:
            begin
            seg=segout2;
            ANin=4'b1111;
            ANout=4'b1011;
            end
        3'b011:
            begin
            seg=segout3;
            ANin=4'b1111;
            ANout=4'b0111;
            end
        3'b100:
            begin
            seg=segin0;
            ANin=4'b1110;
            ANout=4'b1111;
            end
        3'b101:
            begin
            seg=segin1;
            ANin=4'b1101;
            ANout=4'b1111;
            end
        3'b110:
            begin
            seg=segin2;
            ANin=4'b1011;
            ANout=4'b1111;
            end
        3'b111:
            begin
            seg=segin3;
            ANin=4'b0111;
            ANout=4'b1111;
            end
        endcase
    end
endmodule

module SW(
    input clk500,
    output reg [2:0]Switch
    );
    always @ (posedge clk500)
        Switch <= Switch+3'd1;
endmodule
