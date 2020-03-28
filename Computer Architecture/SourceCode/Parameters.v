`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Parameters
// Tool Versions: Vivado 2017.4.1
// Description: Const Parameters
// 
//////////////////////////////////////////////////////////////////////////////////

// 功能说明
    // 为了代码可读性，定义了常量值
// 实验要求  
    // 无需修改

`ifndef CONST_VALUES
`define CONST_VALUES
// ALU_func[3:0]
    `define SLL  4'd0
    `define SRL  4'd1
    `define SRA  4'd2
    `define ADD  4'd3
    `define SUB  4'd4
    `define XOR  4'd5
    `define OR  4'd6
    `define AND  4'd7
    `define SLT  4'd8
    `define SLTU  4'd9
    `define LUI  4'd10
// br_type[2:0]
    `define NOBRANCH  3'd0
    `define BEQ  3'd1
    `define BNE  3'd2
    `define BLT  3'd3
    `define BLTU  3'd4
    `define BGE  3'd5
    `define BGEU  3'd6
// imm_type[2:0]
    `define RTYPE  3'd0
    `define ITYPE  3'd1
    `define STYPE  3'd2
    `define BTYPE  3'd3
    `define UTYPE  3'd4
    `define JTYPE  3'd5  
// load_type[2:0]  six kind of ways to save values to Register
    `define NOREGWRITE  3'b0	//	Do not write Register
    `define LB  3'd1			//	load 8bit from Mem then signed extended to 32bit
    `define LH  3'd2			//	load 16bit from Mem then signed extended to 32bit
    `define LW  3'd3			//	write 32bit to Register
    `define LBU  3'd4			//	load 8bit from Mem then unsigned extended to 32bit
    `define LHU  3'd5			//	load 16bit from Mem then unsigned extended to 32bit

// instruction opcode
    `define opcode_OPIMM    7'b0010011
    `define opcode_OP       7'b0110011
    `define opcode_AUIPC    7'b0010111
    `define opcode_LUI      7'b0110111
    `define opcode_JALR     7'b1100111
    `define opcode_JAL      7'b1101111
    `define opcode_BRANCH   7'b1100011
    `define opcode_LOAD     7'b0000011
    `define opcode_STORE    7'b0100011
// instruction func3
    `define func3_ADD   3'b000 //`func3_ADDI 
    `define func3_SLT   3'b010 //`func3_SLTI 
    `define func3_SLTU  3'b011 //`func3_SLTIU
    `define func3_AND   3'b111 //`func3_ANDI 
    `define func3_OR    3'b110 //`func3_ORI  
    `define func3_XOR   3'b100 //`func3_XORI 
    `define func3_SLL   3'b001 //`func3_SLLI 
    `define func3_SR    3'b101 //`func3_SRI 

    `define func3_BEQ   3'b000
    `define func3_BNE   3'b001
    `define func3_BLT   3'b100
    `define func3_BLTU  3'b110
    `define func3_BGE   3'b101
    `define func3_BGEU  3'b111

    `define func3_BYTE 3'b000
    `define func3_HIGH 3'b001
    `define func3_WORD 3'b010
    `define func3_BU   3'b100
    `define func3_HU   3'b101
//instruction func7
    `define func7_ADD   7'b0000000
    `define func7_SUB   7'b0100000
    `define func7_SRL   7'b0000000
    `define func7_SRA   7'b0100000
`endif
