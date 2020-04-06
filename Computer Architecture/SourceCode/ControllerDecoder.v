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
    // op2_src           ALU的第二个操作数来源。为0时op2选择reg2，为1时op2选择imm，为2时选择CSR，为3时选择0
    // ALU_func          ALU执行的运算类型
    // br_type           branch的判断条件，可以是不进行branch
    // load_npc          写回寄存器的值的来源（PC或者ALU计算结果）, load_npc == 1时选择PC
    // wb_select         写回寄存器的值的来源，wb_select == 0时选择ALU计算结果，wb_select == 1时选择cache内容， wb_select == 2时选择CSR
    // load_type         load类型
    // src_reg_en        指令中src reg的地址是否有效，src_reg_en[1] == 1表示reg1被使用到了，src_reg_en[0]==1表示reg2被使用到了
    // reg_write_en      通用寄存器写使能，reg_write_en == 1表示需要写回reg
    // cache_write_en    按字节写入data cache
    // imm_type          指令中立即数类型
    // alu_src1          alu操作数1来源，alu_src1 == 0表示来自reg1，alu_src1 == 1表示来自PC
    // alu_src2          alu操作数2来源，alu_src2 == 2’b00表示来自reg2，alu_src2 == 2'b01表示来自reg2地址，alu_src2 == 2'b10表示来自立即数，alu_src2 == 2'b11表示来自CSR
// 实验要求
    // 补全模块


`include "Parameters.v"   
module ControllerDecoder(
    input wire [31:0] inst,
    output wire jal,
    output wire jalr,
    output wire [1:0] op2_src,
    output reg [3:0] ALU_func,
    output reg [2:0] br_type,
    output wire load_npc,
    output wire [1:0] wb_select,
    output reg [2:0] load_type,
    output reg [1:0] src_reg_en,
    output reg reg_write_en,
    output reg [3:0] cache_write_en,
    output wire alu_src1,
    output wire [1:0] alu_src2,
    output reg [2:0] imm_type
    );

    // DONE: Complete this module
    wire [6:0] opcode;
    wire [4:0] rd;
    wire [3:0] func3;
    wire [6:0] func7;

    assign opcode = inst[6:0];
    assign rd = inst[11:7];
    assign func3 = inst[14:12];
    assign func7 = inst[31:25];

    assign jal  = (opcode == `opcode_JAL) ? 1 : 0;
    assign jalr = (opcode == `opcode_JALR) ? 1 : 0;
    assign op2_src = (opcode == `opcode_OP) ? 2'h0 :
                                              (opcode == `opcode_SYSTEM) ? ((func3 == `func3_CSRRW || func3 == `func3_CSRRWI) ? 2'h3 : 2'h2) :
                                                                           2'h1;
    assign load_npc = (opcode == `opcode_JAL || opcode == `opcode_JALR) ? 1 : 0;
    assign wb_select = (opcode == `opcode_LOAD) ? 2'h1 :
                                                  (opcode == `opcode_SYSTEM) ? 2'h2 : 2'h0;
    assign alu_src1 = (opcode == `opcode_AUIPC) ? 1 : 0;
    assign alu_src2 = (opcode == `opcode_OP) ? 2'b00 :
                                               (opcode == `opcode_SYSTEM) ? 2'b11 : 2'b10;

    always@(*)
    begin
        case (opcode)
            `opcode_OPIMM  : 
            begin
                case (func3)
                    `func3_ADD  : ALU_func <= `ADD;
                    `func3_SLT  : ALU_func <= `SLT;
                    `func3_SLTU : ALU_func <= `SLTU;
                    `func3_AND  : ALU_func <= `AND;
                    `func3_OR   : ALU_func <= `OR;
                    `func3_XOR  : ALU_func <= `XOR;
                    `func3_SLL  : ALU_func <= `SLL;
                    `func3_SR   :
                        case (func7)
                            `func7_SRL :  ALU_func <= `SRL;
                            `func7_SRA :  ALU_func <= `SRA;
                            default: ALU_func <= `ERROR;
                        endcase
                    default: ALU_func <= `ERROR;
                endcase
                br_type <= `NOBRANCH;
                load_type <= `NOREGWRITE;
                src_reg_en <= 2'b10;
                reg_write_en <= (rd == 5'b0) ? 0 : 1;
                cache_write_en <= 4'b0;
                imm_type <= `ITYPE;
            end
            `opcode_OP     : 
            begin
                case (func3)
                    `func3_ADD  :
                        case (func7)
                            `func7_ADD : ALU_func <= `ADD;
                            `func7_SUB : ALU_func <= `SUB;
                            default: ALU_func <= `ERROR;
                        endcase
                    `func3_SLT  : ALU_func <= `SLT;
                    `func3_SLTU : ALU_func <= `SLTU;
                    `func3_AND  : ALU_func <= `AND;
                    `func3_OR   : ALU_func <= `OR;
                    `func3_XOR  : ALU_func <= `XOR;
                    `func3_SLL  : ALU_func <= `SLL;
                    `func3_SR   :
                        case (func7)
                            `func7_SRL : ALU_func <= `SRL;
                            `func7_SRA : ALU_func <= `SRA;
                            default: ALU_func <= `ERROR;
                        endcase
                    default: ALU_func <= `ERROR;
                endcase
                br_type <= `NOBRANCH;
                load_type <= `NOREGWRITE;
                src_reg_en <= 2'b11;
                reg_write_en <= (rd == 5'b0) ? 0 : 1;
                cache_write_en <= 4'b0;
                imm_type <= `RTYPE;
            end
            `opcode_AUIPC  : 
            begin
                ALU_func <= `ADD;
                br_type <= `NOBRANCH;
                load_type <= `NOREGWRITE;
                src_reg_en <= 2'b00;
                reg_write_en <= (rd == 5'b0) ? 0 : 1;
                cache_write_en <= 4'b0;
                imm_type <= `UTYPE;
            end
            `opcode_LUI    : 
            begin
                ALU_func <= `LUI;
                br_type <= `NOBRANCH;
                load_type <= `NOREGWRITE;
                src_reg_en <= 2'b00;
                reg_write_en <= (rd == 5'b0) ? 0 : 1;
                cache_write_en <= 4'b0;
                imm_type <= `UTYPE;
            end
            `opcode_JALR   : 
            begin
                ALU_func <= `ADD;
                br_type <= `NOBRANCH;
                load_type <= `NOREGWRITE;
                src_reg_en <= 2'b10;
                reg_write_en <= (rd == 5'b0) ? 0 : 1;
                cache_write_en <= 4'b0;
                imm_type <= `ITYPE;
            end
            `opcode_JAL    : 
            begin
                ALU_func <= `NOOP;
                br_type <= `NOBRANCH;
                load_type <= `NOREGWRITE;
                src_reg_en <= 2'b00;
                reg_write_en <= (rd == 5'b0) ? 0 : 1;
                cache_write_en <= 4'b0;
                imm_type <= `JTYPE;
            end
            `opcode_BRANCH :
            begin
                ALU_func <= `NOOP;
                case (func3)
                    `func3_BEQ  : br_type <= `BEQ ;
                    `func3_BNE  : br_type <= `BNE ;
                    `func3_BLT  : br_type <= `BLT ;
                    `func3_BLTU : br_type <= `BLTU;
                    `func3_BGE  : br_type <= `BGE ;
                    `func3_BGEU : br_type <= `BGEU;
                    default: br_type <= `NOBRANCH;
                endcase
                load_type <= `NOREGWRITE;
                src_reg_en <= 2'b11;
                reg_write_en <= 0;
                cache_write_en <= 4'b0;
                imm_type <= `BTYPE;
            end
            `opcode_LOAD   : 
            begin
                ALU_func <= `ADD;
                br_type <= `NOBRANCH;
                case (func3)
                    `func3_BYTE : load_type <= `LB;
                    `func3_HIGH : load_type <= `LH;
                    `func3_WORD : load_type <= `LW;
                    `func3_BU   : load_type <= `LBU;
                    `func3_HU   : load_type <= `LHU;
                    default: load_type <= `NOREGWRITE;
                endcase
                src_reg_en <= 2'b10;
                reg_write_en <= (rd == 5'b0) ? 0 : 1;
                cache_write_en <= 4'b0;
                imm_type <= `ITYPE;
            end
            `opcode_STORE  :
            begin
                ALU_func <= `ADD;
                br_type <= `NOBRANCH;
                load_type <= `NOREGWRITE;
                src_reg_en <= 2'b11;
                reg_write_en <= 0;
                case (func3)
                    `func3_BYTE : cache_write_en <= 4'b0001;
                    `func3_HIGH : cache_write_en <= 4'b0011;
                    `func3_WORD : cache_write_en <= 4'b1111;
                    default: cache_write_en <= 4'b0;
                endcase
                imm_type <= `STYPE;
            end
            default: 
            begin
                ALU_func <= `ERROR;
                br_type <= `NOBRANCH;
                load_type <= `NOREGWRITE;
                src_reg_en <= 2'b00;
                reg_write_en <= 0;
                cache_write_en <= 4'b0;
                imm_type <= `RTYPE;
            end
        endcase
    end

endmodule
