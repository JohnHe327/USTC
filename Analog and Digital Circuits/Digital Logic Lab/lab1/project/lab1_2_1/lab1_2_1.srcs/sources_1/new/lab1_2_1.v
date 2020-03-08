`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/12 13:29:19
// Design Name: 
// Module Name: lab1_2_1
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


module lab1_2_1(
    input x_in[7:0],
    output y_out[7:0]
    );
    
    assign y_out[0]=x_in[7];
    assign y_out[1]=x_in[6];
    assign y_out[2]=x_in[5];
    assign y_out[3]=x_in[4];
    assign y_out[4]=x_in[3];
    assign y_out[5]=x_in[2];
    assign y_out[6]=x_in[1];
    assign y_out[7]=x_in[0];
endmodule
