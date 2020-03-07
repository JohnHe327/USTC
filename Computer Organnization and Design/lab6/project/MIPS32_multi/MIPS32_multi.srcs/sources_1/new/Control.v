`timescale 1ns / 1ps

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
    parameter LW = 6'b100011,SW = 6'b101011,RType = 6'b000000,ADDI = 6'b001000,ANDI= 6'b001100,ORI = 6'b001101,
                XORI = 6'b001110,SLTI = 6'b001010,BEQ = 6'b000100,BNE = 6'b000101,J = 6'b000010;
    parameter IF = 0,ID = 1,MemAddr = 2,ReadMem = 3,WB = 4,WriteMem = 5,RExecution = 6,RWB = 7,BranchE = 8,
                Jump = 9,IExecution = 10,IWB = 11,BranchN = 12;
    
    reg [3:0] state,next_state;
    
    always @ (posedge clk, posedge rst)
    begin
        if(rst) state <= IF;
        else state <= next_state;
    end
    
    always @ (state,run,Op)
    begin
        case(state)
            IF: if(run) next_state = ID;
                else next_state = IF;
            ID:
                case(Op)
                    LW:     next_state = MemAddr;
                    SW:     next_state = MemAddr;
                    RType:  next_state = RExecution;
                    ADDI:   next_state = IExecution;
                    ANDI:   next_state = IExecution;
                    ORI:    next_state = IExecution;
                    XORI:   next_state = IExecution;
                    SLTI:   next_state = IExecution;
                    BEQ:    next_state = BranchE;
                    BNE:    next_state = BranchN;
                    J:      next_state = Jump;
                    default: next_state = IF;
                endcase
            MemAddr:
                case(Op)
                    LW:next_state = ReadMem;
                    SW:next_state = WriteMem;
                    default:next_state = 0;
                endcase
            ReadMem:    next_state = WB;
            WB:         next_state = IF;
            WriteMem:   next_state = IF;
            RExecution: next_state = RWB;
            RWB:        next_state = IF;
            BranchE:    next_state = IF;
            Jump:       next_state = IF;
            IExecution: next_state = IWB;
            IWB:        next_state = IF;
            BranchN:    next_state = IF;
            default:    next_state = IF;
        endcase 
    end
    
    always @ (state,run,Zero)
    begin
        begin
            case(state)
                IF:
                begin
                if (run)    signal = {20'bx10101x00000010xxxxx,Zero};
                else        signal = 21'b0;
                end
                ID:         signal = {20'b00xx00xxx000110xx111,Zero};
                MemAddr:    signal = {20'b00xx00xxx001100xx001,Zero};
                ReadMem:    signal = {20'b001100xxxxxxxx0x1xx0,Zero};
                WB:         signal = {20'b00x0001xxxxxxx100xxx,Zero};
                WriteMem:   signal = {20'b001x10xxxxxxxx0xxx00,Zero};
                RExecution: signal = {20'b00xx00xxx101000xx001,Zero};
                RWB:        signal = {20'b00xx000xxxxxxx11xxx0,Zero};
                BranchE:    signal = {20'b10xx00x01011000xx000,Zero};
                Jump:       signal = {20'bx1xx00x10xxxxx0xxxxx,Zero};
                IExecution: signal = {20'b00xx00xxx111100xxxx1,Zero};
                IWB:        signal = {20'b00xx000xxxxxxx10xxx0,Zero};
                BranchN:    signal = {20'b10xx00x01011000xx000,~Zero};
                default:signal = 21'b0;
            endcase
        end
    end
endmodule