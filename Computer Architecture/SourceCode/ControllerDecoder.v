`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
//           John He (hechunwang2000327@hotmail.com)
// Design Name: RV32I Core
// Module Name: Controller Decoder
// Tool Versions: Vivado 2017.4.1
// Description: Controller Decoder Module
// 
//////////////////////////////////////////////////////////////////////////////////

//  功能说明
    //  对指令进行译码，将其翻译成控制信号，传输给各个部件
// 输入
    // Inst              待译码指令
// 输出
    // jal               jal跳转指令
    // jalr              jalr跳转指令
    // op2_src           ALU的第二个操作数来源。为1时，op2选择imm，为0时，op2选择reg2
    // ALU_func          ALU执行的运算类型
    // br_type           branch的判断条件，可以是不进行branch
    // load_npc          写回寄存器的值的来源（PC或者ALU计算结果）, load_npc == 1时选择PC
    // wb_select         写回寄存器的值的来源（Cache内容或者ALU计算结果），wb_select == 1时选择cache内容
    // load_type         load类型
    // src_reg_en        指令中src reg的地址是否有效，src_reg_en[1] == 1表示reg1被使用到了，src_reg_en[0]==1表示reg2被使用到了
    // reg_write_en      通用寄存器写使能，reg_write_en == 1表示需要写回reg
    // cache_write_en    按字节写入data cache
    // imm_type          指令中立即数类型
    // alu_src1          alu操作数1来源，alu_src1 == 0表示来自reg1，alu_src1 == 1表示来自PC
    // alu_src2          alu操作数2来源，alu_src2 == 2’b00表示来自reg2，alu_src2 == 2'b01表示来自reg2地址，alu_src2 == 2'b10表示来自立即数
// 实验要求
    // 补全模块


`include "Parameters.v"   
module ControllerDecoder(
    input wire [31:0] inst,
    output wire jal,
    output wire jalr,
    output wire op2_src,
    output reg [3:0] ALU_func,
    output reg [2:0] br_type,
    output wire load_npc,
    output wire wb_select,
    output reg [2:0] load_type,
    output reg [1:0] src_reg_en,
    output reg reg_write_en,
    output reg [3:0] cache_write_en,
    output wire alu_src1,
    output wire [1:0] alu_src2,
    output reg [2:0] imm_type
    );

    // TODO: Complete this module
    wire [6:0] opcode;
    wire [3:0] func3;
    wire [6:0] func7;

    assign opcode = inst[6:0];
    assign func3 = inst[14:12];
    assign func7 = inst[31:25];

    always@(*)
    begin
        case (opcode)
            `opcode_OPIMM  : 
                case (func3)
                    `func3_ADD  :
                    `func3_SLT  :
                    `func3_SLTU :
                    `func3_AND  :
                    `func3_OR   :
                    `func3_XOR  :
                    `func3_SLL  :
                    `func3_SR   :
                        case (func7)
                            `func7_SRL : 
                            `func7_SRA : 
                            default:
                        endcase
                    default: 
                endcase
            `opcode_OP     : 
                case (func3)
                    `func3_ADD  :
                        case (func7)
                            `func7_ADD : 
                            `func7_SUB : 
                            default: 
                        endcase
                    `func3_SLT  :
                    `func3_SLTU :
                    `func3_AND  :
                    `func3_OR   :
                    `func3_XOR  :
                    `func3_SLL  :
                    `func3_SR   :
                        case (func7)
                            `func7_SRL : 
                            `func7_SRA :
                            default: 
                        endcase
                    default: 
                endcase
            `opcode_AUIPC  : 
            `opcode_LUI    : 
            `opcode_JALR   : 
            `opcode_JAL    : 
            `opcode_BRANCH :
                case (func3)
                    `func3_BEQ  :
                    `func3_BNE  :
                    `func3_BLT  :
                    `func3_BLTU :
                    `func3_BGE  :
                    `func3_BGEU :
                    default: 
                endcase
            `opcode_LOAD   : 
                case (func3)
                    `func3_BYTE :
                    `func3_HIGH :
                    `func3_WORD :
                    `func3_BU   :
                    `func3_HU   :
                    default: 
                endcase
            `opcode_STORE  :
                case (func3)
                    `func3_BYTE :
                    `func3_HIGH :
                    `func3_WORD :
                    default: 
                endcase
            default: 
        endcase
    end

endmodule
