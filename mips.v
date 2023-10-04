module mips
(
	input Clk,Reset,
	output [15:0] test_value
);
wire [31:0] PC,Instr,ReadData,WriteData,ALUOut;
wire MemWrite,RegWrite,RegDst,ALUSrc,MemtoReg,PCSrc,Branch,Jump,Zero;
wire [2:0] ALUControl;


instrution_memory #(.n_bits(32)) Instruction_memory
(
	.A(PC[9:2]),
	.RD(Instr)
);

data_memory #(.n_bits(32)) Data_Memory
(
	.clk(Clk),
	.A(ALUOut),
	.WD(WriteData),
	.WE(MemWrite),
	.RD(ReadData),
	.test_value(test_value)
);

controller control
(
	.Opcode(Instr[31:26]),
	.Funct(Instr[5:0]),
	.MemtoReg(MemtoReg),
	.ALUSrc(ALUSrc),
	.RegDst(RegDst),
	.RegWrite(RegWrite),
	.Branch(Branch),
	.Jump(Jump),
	.MemWrite(MemWrite),
	.ALUControl(ALUControl)
);

datapath #(.n_bits(32)) Data_path
(
	.CLK(Clk),
	.Reset(Reset),
	.Instr(Instr),
	.ReadData(ReadData),
	.MemtoReg(MemtoReg),
	.ALUSrc(ALUSrc),
	.RegDst(RegDst),
	.RegWrite(RegWrite),
	.PCSrc(PCSrc),
	.Jump(Jump),
	.MemWrite(MemWrite),
	.ALUControl(ALUControl),
	.Zero(Zero),
	.PC(PC),
	.ALUOut(ALUOut),
	.WriteData(WriteData)
);


assign PCSrc = Zero & Branch;
endmodule