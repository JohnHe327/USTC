`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/26 16:52:09
// Design Name: 
// Module Name: CPU
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


module CPU(
    input clk,rst,
    input run,
    input [7:0]addr,
    output [31:0]mem_data,
    output [31:0]reg_data,
    output [31:0]PC
    );
    //datapath
    wire [31:0]PCin;
    wire [31:0]WriteData,MemData,MDR;
    wire [31:0]MAR;
    wire Zero;
    wire [31:0]JumpAddr;
    wire [31:0]ALUresult,ALUOut;
    wire [31:0]IR;
    wire [31:0]WriteReg;
    wire [31:0]ReadData1,ReadData2;
    wire [31:0]A,B;
    wire [31:0]ALUsrcA,ALUsrcB;
    wire [31:0]Imm,ImmBranch;//,UImm,IImm;
    
    
    //control signal
    wire MemWrite,MemRead;
    wire IorD;
    wire PCWrite,PCWriteCond;
    wire IRWrite;
    wire RegDst;
    wire MemToReg;
    wire RegWrite;
    wire ALUSrcA;
    wire [1:0]ALUSrcB;
    wire [1:0]ALUOp;
    wire [3:0]ALUControl;
    wire [1:0]PCSource;
    wire PCen;
    wire Z;
    wire MDRWrite,AWrite,BWrite,ALUOutWrite;
//    wire IorU;
    
    //pc
    PC pc(clk,rst,PCen,PCin,PC);
    MUX3to1 PCMUX(ALUresult,ALUOut,JumpAddr,PCSource,PCin);
    assign JumpAddr = {PC[31:28],IR[25:0],2'b00};
    assign PCen = PCWrite || (Z && PCWriteCond);
    
    //Memory
    MUX2to1 IorDMUX(PC,ALUOut,IorD,MAR);
    dist_mem_gen_0 Mem(.a(MAR[9:2]),.clk(clk),.d(B),.spo(MemData),.we(MemWrite),.dpo(mem_data),.dpra(addr));
    DReg MDRreg(clk,rst,MemData,MDRWrite,MDR);
    
    //IR
    IReg IRreg(clk,rst,MemData,IRWrite,IR);
    
    //Registers
    MUX2to1 RegDstMUX({27'b0,IR[20:16]},{27'b0,IR[15:11]},RegDst,WriteReg);
    MUX2to1 WriteDataMUX(ALUOut,MDR,MemToReg,WriteData);
    Reg_file Registers(rst,clk,IR[25:21],IR[20:16],addr[4:0],WriteReg[4:0],RegWrite,WriteData,ReadData1,ReadData2,reg_data);
    DReg AReg(clk,rst,ReadData1,AWrite,A);
    DReg BReg(clk,rst,ReadData2,BWrite,B);
    
    //ALU
    MUX2to1 ALUsrcAMUX(PC,A,ALUSrcA,ALUsrcA);
    assign Imm = IR[15]?{16'hffff,IR[15:0]}:{16'b0,IR[15:0]};
//    assign UImm = {16'b0,IR[15:0]};
//    MUX2to1 ImmMUX(IImm,UImm,IorU,Imm);
    assign ImmBranch = {Imm[29:0],2'b00};
    MUX4to1 ALUsrcBMUX(B,4,Imm,ImmBranch,ALUSrcB,ALUsrcB);
    ALU alu(ALUControl,ALUsrcA,ALUsrcB,ALUresult,Zero);
    DReg ALUOutReg(clk,rst,ALUresult,ALUOutWrite,ALUOut);
    
    //control
//    Control control(clk,rst,run,IR[31:26],IR[5:0],Zero,PCWriteCond,PCWrite,IorD,MemRead,MemWrite,IRWrite,MemToReg,PCSource,ALUOp,ALUSrcA,ALUSrcB,RegWrite,RegDst,Z);
    Control control(clk,rst,run,IR[31:26],Zero,PCWriteCond,PCWrite,IorD,MemRead,MemWrite,IRWrite,MemToReg,PCSource,ALUOp,ALUSrcA,ALUSrcB,RegWrite,RegDst,MDRWrite,AWrite,BWrite,ALUOutWrite,Z);
    ALUcontrol ALUCtrl(ALUOp,IR[5:0],IR[31:26],ALUControl);//not alu_control=??
endmodule