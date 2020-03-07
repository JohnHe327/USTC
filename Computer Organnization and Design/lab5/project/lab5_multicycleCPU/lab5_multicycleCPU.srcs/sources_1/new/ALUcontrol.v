`timescale 1ns / 1ps

module ALUcontrol(
    input [1:0]ALUOp,
    input [5:0]funct,
    input [5:0]Op,
    output reg [3:0]ALUControl
    );
    always @ (*)
    begin
        case(ALUOp)
            2'b00:ALUControl = 4'b0010;
            2'b01:ALUControl = 4'b0110;
            2'b10:
            begin
                case(funct)
                    6'b100000:ALUControl = 4'b0010;//add
                    6'b100010:ALUControl = 4'b0110;//sub
                    6'b100100:ALUControl = 4'b0000;//and
                    6'b100101:ALUControl = 4'b0001;//or
                    6'b101010:ALUControl = 4'b0111;//slt
                    6'b100110:ALUControl = 4'b0011;//xor
                    6'b100111:ALUControl = 4'b1100;//nor
                    default:ALUControl = 4'bx;
                endcase
            end
            2'b11:
            begin
                case(Op)
                    6'b001000:ALUControl = 4'b0010;//addi
                    6'b001100:ALUControl = 4'b0000;//andi
                    6'b001101:ALUControl = 4'b0001;//ori
                    6'b001110:ALUControl = 4'b0011;//xori
                    6'b001010:ALUControl = 4'b0111;//slti
                    default:ALUControl = 4'bx;
                endcase
            end
        endcase
    end
endmodule