`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 20:59:48
// Design Name: 
// Module Name: Parallel_in_serial_out_load_enable_tb
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


module Parallel_in_serial_out_load_enable_tb(
    );
    reg In,Clk,En,load;
    reg [3:0]parain;
    wire Out;
    wire [3:0]rc;
    
    Parallel_in_serial_out_load_enable DUT(.In(In),.Clk(Clk),.Out(Out),.load(load),.En(En),.ParaIn(parain),.RegCont(rc));

    initial
    begin
    Clk=0;
        forever
        begin
            #10 Clk=1;
            #10 Clk=0;
        end
    end
    
    initial
    begin
        load=0;
        #60 load=1;
        #20 load=0;
        #120 load=1;
        #20 load=0;
        #55 load=1;
        #20 load=0;
        #65 load=1;
        #20 load=0;
    end
    
    initial
    begin
        En=0;
        #100 En=1;
        #220 En=0;
    end
    
    initial
        In=1;
        
    initial
    begin
        parain=4'b0000;
        #20 parain=4'b0101;
        #160 parain=4'b1001;
    end
endmodule
