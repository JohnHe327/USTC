`timescale 1ns / 1ps

module DDU(
    input clk,cont,step,mem,inc,dec,
    input [7:0]pc,
    input [31:0]mem_data,reg_data,
    output reg [7:0]addr,
    output reg run,
    output [15:0]led,
    output [7:0]an,
    output [6:0]seg
    );
    wire clk_1k;
    clk1khz clk1kHz(clk,clk_1k);
    wire [31:0]data;
    assign data = mem ? mem_data : reg_data;
    assign led = {pc,mem ? addr[7:5] : 3'b000,addr[4:0]};
    SegDisplay SD(data,clk_1k,seg,an);
    
    wire inc_signal,dec_signal;
    parameter READY = 0,EXECUTE = 1,WAITING = 2;
    reg [1:0] inc_status = WAITING,dec_status = WAITING;
    
    assign inc_signal = (inc_status == EXECUTE) ? ~clk : 0;
    assign dec_signal = (dec_status == EXECUTE) ? ~clk : 0;
    
    always @ (posedge clk) 
    begin
        if (inc_status == READY && inc) inc_status <= EXECUTE;
        else if (inc_status == EXECUTE && ~inc) inc_status <= READY;
        else if (inc_status == EXECUTE && inc) inc_status <= WAITING;
        else if (inc_status == WAITING && ~inc) inc_status <= READY;
        else inc_status <= inc_status;
        
        if (dec_status == READY && dec) dec_status <= EXECUTE;
        else if (dec_status == EXECUTE && ~dec) dec_status <= READY;
        else if (dec_status == EXECUTE && dec) dec_status <= WAITING;
        else if (dec_status == WAITING && ~dec) dec_status <= READY;
        else dec_status <= dec_status;
    end
    
    initial addr=0;
    always @ (posedge clk) begin
        if (inc_signal && !dec_signal) addr <= addr+1;
        else if (!inc_signal && dec_signal) addr <= addr-1;
        else addr <= addr;
    end
    
    reg [1:0] step_status = WAITING;
    initial run=0;
    always @ (posedge clk) begin
        if (cont) run <= 1;
        else if (step_status == EXECUTE) run <= 1;
        else run <= 0;
    end
    
    always @ (posedge clk) begin
        if (cont) step_status <= WAITING;
        else if (step_status == READY && step) step_status <= EXECUTE;
        else if (step_status == EXECUTE && ~step) step_status <= READY;
        else if (step_status == EXECUTE && step) step_status <= WAITING;
        else if (step_status == WAITING && ~step) step_status <= READY;
        else step_status <= step_status;
    end
endmodule