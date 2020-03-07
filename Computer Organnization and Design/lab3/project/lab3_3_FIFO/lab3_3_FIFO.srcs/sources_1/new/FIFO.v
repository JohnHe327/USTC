`timescale 1ns / 1ps

module FIFO(
    input en_out,en_in,
    input [3:0] in,
    input rst,CLK100MHZ,
    output [15:0] display,
    output reg [3:0] out,
    output empty,full,
    output clk
    );
    wire clk500,clk1;
    clock(CLK100MHZ,clk500,clk1);
    reg [2:0] head,tail;
    assign full= (head%8==(tail+1)%8);
    assign empty= head==tail;
    assign clk=clk1;
    
    reg [2:0]wa,ra,ra1;
    reg [3:0]wd;
    wire[3:0]rd,rd1;
    reg we;
    
    always @ (posedge clk1 or posedge rst)
    begin
        if(rst)
        begin
            head=0;
            tail=0;
            we=0;
            ra1=0;
        end
        else
        begin
            we=0;
            if(en_in && ~full)
            begin
                wd=in;
                wa=tail;
                tail=(tail+1)%8;
                we=1;
            end
            else if(en_out && ~empty)
            begin
                head=(head+1)%8;
                ra1=head%8;
            end
        end
    end
    
    always @ (posedge clk500 or posedge rst)
    begin
        if(rst) ra=0;
        else
        begin
            if(ra%8 == (tail-1)%8) ra=head%8;
            else ra=(ra+1)%8;
        end
    end
    RegisterFile RF1 (ra,ra1,wa,wd,we,rst,clk500,rd,rd1);
    
    always @ (posedge clk1 or posedge rst)
    begin
        if(rst) out=0;
        else if(en_out) out=rd1;
    end
    
    wire [6:0] seg0;
    wire dot;
    reg [7:0] an;
    reg [6:0] seg;
    bcd2seg B2S (rd,seg0);
    
    assign dot= ~(ra==head);
    always @*
    begin
        if(empty)
        begin
            an= 8'b11111111 ^ 8'd1<<head;
            seg=7'b1111111;
        end
        else
        begin
            an= 8'b11111111 ^ 8'd1<<ra;
            seg=seg0;
        end
    end
    assign display={dot,seg,an};
endmodule
