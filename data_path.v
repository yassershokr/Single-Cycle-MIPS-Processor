// Engineer: Yasser Mohamed
// Create Date: 28/9/2023 
// Module Name: Data Path
// Project Name: Mips Processor

module datapath #(parameter n_bits = 32)
(
	input CLK,Reset,
	input [n_bits-1:0]Instr,
	input [n_bits-1:0]ReadData,
	input MemtoReg,ALUSrc,RegDst,RegWrite,PCSrc,Jump,MemWrite,
	input [2:0]ALUControl,
	output Zero,
	output [n_bits-1:0]PC,ALUOut,WriteData
);

wire [n_bits-1:0]result_mux_1,ALUResult,Result,SignImm_before_shift,SignImm_after_shift,PCBranch,PC_now,PCdash,PCPlus4,PCJump_after_concat,SrcA,SrcB,RD2;
wire [4:0]WriteReg;
wire [27:0]PCJump_before_concat;

mux2to1 #(.n_bit(32)) mux1
(
  	.input0(PCPlus4),
  	.input1(PCBranch),
  	.sel(PCSrc),
 	.out(result_mux_1)
);

mux2to1 #(.n_bit(32)) mux2
(
 	.input0(result_mux_1),
 	.input1(PCJump_after_concat),
  	.sel(Jump),
 	.out(PCdash)
);

Program_Counter #(.n_bit(32)) counter
(
	.clk(CLK),
	.reset_n(Reset),
	.PC_dash(PCdash),
	.PC(PC_now)
);

adder #(.n_bits(32))adding4
(
	.input1(PC_now),
	.input2(32'h00000004),
	.out(PCPlus4)
);

register_file #(.n_bits(32)) Register
(
	.clk(CLK),
	.WD3(Result),
	.A1(Instr[25:21]),
	.A2(Instr[20:16]),
	.A3(WriteReg[4:0]),
	.WE3(RegWrite),
	.RD1(SrcA),
	.RD2(RD2)
);


mux2to1 #(.n_bit(5)) mux3
(
 	.input0(Instr[20:16]),
 	.input1(Instr[15:11]),
  	.sel(RegDst),
 	.out(WriteReg)
);

mux2to1 #(.n_bit(32)) mux4
(
 	.input0(RD2),
 	.input1(SignImm_before_shift),
  	.sel(ALUSrc),
 	.out(SrcB)
);


mux2to1 #(.n_bit(32)) mux5
(
 	.input0(ALUResult),
 	.input1(ReadData),
  	.sel(MemtoReg),
 	.out(Result)
);

sign_extend #(.n_bits(32))Sign_Extend
(
	.inp(Instr[15:0]),
	.out(SignImm_before_shift)
);

shift_left_2 #(.n_bits_in(32),.n_bits_out(32)) shift_instr_2
( 
	.in(SignImm_before_shift),
	.out(SignImm_after_shift)
);

adder #(.n_bits(32))adder1
(
	.input1(SignImm_after_shift),
	.input2(PCPlus4),
	.out(PCBranch)
);

shift_left_2 #(.n_bits_in(26),.n_bits_out(28)) shift_instr_1
( 
	.in(Instr[25:0]),
	.out(PCJump_before_concat)
);

alu #(.n_bits(32)) ALU
(
	.srca(SrcA),
	.srcb(SrcB),
	.ALUControl(ALUControl),
	.Zero(Zero),
	.ALUResult(ALUResult)	
);






assign PCJump_after_concat={PCPlus4[31:28],PCJump_before_concat};

assign PC = PC_now;
assign WriteData = RD2;
assign ALUOut = ALUResult;

endmodule