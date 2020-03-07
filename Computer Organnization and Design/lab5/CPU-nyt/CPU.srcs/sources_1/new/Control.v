`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/26 18:06:47
// Design Name: 
// Module Name: Control
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


module Control(
    input clk,rst,
    input run,
    input [5:0]Op,
    input Zero,
    output PCWriteCond,PCWrite,
    output IorD,
    output MemRead,MemWrite,
    output IRWrite,
    output MemToReg,
    output [1:0]PCSource,
    output [1:0]ALUOp,
    output ALUSrcA,
    output [1:0]ALUSrcB,
    output RegWrite,RegDst,
    output MDRWrite,AWrite,BWrite,ALUOutWrite,
    output Z
);
    reg [20:0]signal;
    assign {PCWriteCond,PCWrite,IorD,MemRead,MemWrite,IRWrite,MemToReg,PCSource,ALUOp,ALUSrcA,ALUSrcB,RegWrite,RegDst,MDRWrite,AWrite,BWrite,ALUOutWrite,Z} = signal;
    parameter LW = 6'b100011;
    parameter SW = 6'b101011;
    parameter RType = 6'b000000;
    parameter ADDI = 6'b001000;
    parameter ANDI= 6'b001100;
    parameter ORI = 6'b001101;
    parameter XORI = 6'b001110;
    parameter SLTI = 6'b001010;
    parameter BEQ = 6'b000100;
    parameter BNE = 6'b000101;
    parameter J = 6'b000010;
    
    parameter IF = 0;
    parameter ID = 1;
    parameter MemAddr = 2;
    parameter ReadMem = 3;
    parameter WB = 4;
    parameter WriteMem = 5;
    parameter RExecution = 6;
    parameter RWB = 7;
    parameter BranchE = 8;
    parameter Jump = 9;
    parameter IExecution = 10;
    parameter IWB = 11;
    parameter BranchN = 12;
//    parameter Idle = 13;
    
    reg [3:0]state,next_state;
    
    always @ (posedge clk, posedge rst)
    begin
        if(rst) state <= IF;
        else state <= next_state;
    end
    
    always @ (state,run,Op)
    begin
        case(state)
            //Idle: if(run) next_state = IF; else next_state = Idle;
            IF: if(run) next_state = ID; else next_state = IF;
            ID:
                case(Op)
                    LW: next_state = MemAddr;
                    SW: next_state = MemAddr;
                    RType: next_state = RExecution;
                    ADDI: next_state = IExecution;
                    ANDI: next_state = IExecution;
                    ORI: next_state = IExecution;
                    XORI:next_state = IExecution;
                    SLTI:next_state = IExecution;
                    BEQ: next_state = BranchE;
                    BNE:next_state = BranchN;
                    J: next_state = Jump;
                    default: next_state = IF;
                endcase
            MemAddr:
                case(Op)
                    LW:next_state = ReadMem;
                    SW:next_state = WriteMem;
                    default:next_state=0;
                endcase
            ReadMem:next_state = WB;
            WB:next_state = IF;
            WriteMem:next_state = IF;
            RExecution:next_state = RWB;
            RWB:next_state = IF;
            BranchE:next_state = IF;
            Jump:next_state = IF;
            IExecution:next_state = IWB;
            IWB:next_state = IF;
            BranchN:next_state = IF;
            default:next_state = IF;
        endcase 
    end
    
    always @ (state,run,Zero)
    begin
        begin
            case(state)
                IF:
                begin
                if (run)
                begin
//                    signal = 17'b010101x0000001xxx;
//assign {PCWriteCond,PCWrite,IorD,MemRead,MemWrite,IRWrite,MemToReg,PCSource,ALUOp,ALUSrcA,ALUSrcB,RegWrite,RegDst,MDRWrite,AWrite,BWrite,ALUOutWrite,Z} = signal;
//,    
                    signal = {20'bx10101x00000010xxxxx,Zero};
                end
                else begin
                    signal = 21'b0;
                end
                end
                ID:
                begin
//                    signal = 17'b00x00xxxx000110xx;
                    signal = {20'b00xx00xxx000110xx111,Zero};
                end
                MemAddr:
                begin
//                    signal = 17'bxxxxxxxxx00110xxx;
                    signal = {20'b00xx00xxx001100xx001,Zero};
                end
                ReadMem:
                begin
//                    signal = 17'bxx11xxxxxxxxxxxxx;
                    signal = {20'b001100xxxxxxxx0x1xx0,Zero};
                end
                WB:
                begin
//                    signal = 17'bxxx01x1xxxxxxx10x;
                    signal = {20'b00x0001xxxxxxx100xxx,Zero};
                end
                WriteMem:
                begin
//                    signal = 17'bxx1x1xxxxxxxxxxxx;
                    signal = {20'b001x10xxxxxxxx0xxx00,Zero};
                end
//assign {PCWriteCond,PCWrite,IorD,MemRead,MemWrite,IRWrite,MemToReg,PCSource,ALUOp,ALUSrcA,ALUSrcB,RegWrite,RegDst,MDRWrite,AWrite,BWrite,ALUOutWrite,Z} = signal;
                RExecution:
                begin
//                   signal = 17'bxxxxxxxxx10100xxx;
                    signal = {20'b00xx00xxx101000xx001,Zero};
                end
                RWB:
                begin
//                    signal = 17'bxxxx1x0xxxxxxx11x;
                    signal = {20'b00xx000xxxxxxx11xxx0,Zero};
                end
                BranchE:
                begin
//                    signal = {16'b1xxxxxx0101100xx,Zero};
                    signal = {20'b10xx00x01011000xx000,Zero};
                end
                Jump:
                begin
//                    signal = 17'bx1xxxxx10xxxxxxxx;
                    signal = {20'bx1xx00x10xxxxx0xxxxx,Zero};
                end
                IExecution:
                begin
//                    ALUSrcA <= 1;
//                    ALUSrcB <= 2;
//                    ALUOp <= 3;//???
//                    signal = 17'bxxxxxxxxx11110xxx;
                    signal = {20'b00xx00xxx111100xxxx1,Zero};
                end
//assign {PCWriteCond,PCWrite,IorD,MemRead,MemWrite,IRWrite,MemToReg,PCSource,ALUOp,ALUSrcA,ALUSrcB,RegWrite,RegDst,MDRWrite,AWrite,BWrite,ALUOutWrite,Z} = signal;

                IWB:
                begin
//                    RegDst <= 0;
//                    RegWrite <= 1;
//                    MemToReg <= 0;
//                    signal = 17'bxxxxxx0xxxxxxx10x;
                    signal = {20'b00xx000xxxxxxx10xxx0,Zero};
                end
                BranchN:
                begin
//                    ALUSrcA <= 1;
//                    ALUSrcB <= 0;
//                    ALUOp <= 1;
//                    PCWriteCond <= 1;
//                    PCSource <= 1;
//                    Z = ~Zero;
// {PCWriteCond,PCWrite,IorD,MemRead,MemWrite,IRWrite,MemToReg,PCSource,ALUOp,ALUSrcA,ALUSrcB,RegWrite,RegDst,Z}
//                signal = {16'b1xxxxxx0101100xx,~Zero};
                    signal = {20'b10xx00x01011000xx000,~Zero};
                end
                default:signal = 21'b0;
            endcase
        end
    end
        
endmodule
