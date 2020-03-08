`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/23 14:02:35
// Design Name: 
// Module Name: lab9_1_1
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

module FA(
    input a,
    input b,
    input ci,
    output s,
    output co
    );
    wire x1,x2,x3;
    wire na,nb,nc;
    wire y1,y2,y3,y4;
    parameter AD=2,OD=2,ND=2;
    and #(AD) A11(x1,a,b);
    and #(AD) A12(x2,a,ci);
    and #(AD) A13(x3,b,ci);
    or #(OD) O11(co,x1,x2,x3);
    
    not #(ND) N21(na,a);
    not #(ND) N22(nb,b);
    not #(ND) N23(nc,ci);
    and #(AD) A21(y1,na,nb,ci);
    and #(AD) A22(y2,na,b,nc);
    and #(AD) A23(y3,a,nb,nc);
    and #(AD) A24(y4,a,b,ci);
    or #(OD) O21(s,y1,y2,y3,y4);
endmodule
