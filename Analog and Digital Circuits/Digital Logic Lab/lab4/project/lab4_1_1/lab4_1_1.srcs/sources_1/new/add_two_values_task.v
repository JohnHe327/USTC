`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/01 19:58:56
// Design Name: 
// Module Name: add_two_values_task
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


module add_two_values_task(
    input [3:0]a,
    input [3:0]b,
    output reg [3:0] ans,
    output reg cout
    );
    
    
    task add_two_values;
        input [3:0] x;
        input [3:0] y;
        output [3:0] A;
        output C;
        
        {C,A}=x+y;
    endtask
    
    always @ *
    add_two_values(a,b,ans,cout);
endmodule
