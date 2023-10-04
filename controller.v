// Engineer: Yasser Mohamed
// Create Date: 28/9/2023 
// Module Name: Controller
// Project Name: Mips Processor

module controller
(
	input [5:0]Opcode,
	input [5:0]Funct,
	output  MemtoReg,
	output  ALUSrc,
	output  RegDst,
	output  RegWrite,
	output  Branch,
	output Jump,
	output MemWrite,
	output[2:0] ALUControl
);
wire[1:0]ALUOp;

main_decoder Main_Decoder
(
	.Opcode(Opcode),
	.MemtoReg(MemtoReg),
	.ALUSrc(ALUSrc),
	.RegDst(RegDst),
	.RegWrite(RegWrite),
	.Branch(Branch),
	.ALUOp(ALUOp),
	.Jump(Jump),
	.MemWrite(MemWrite)
);
alu_decoder ALU_Decoder
(
	.Funct(Funct),
	.ALUOp(ALUOp),
  	.ALUControl(ALUControl)
);
endmodule