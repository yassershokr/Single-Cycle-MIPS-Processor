// Engineer: Yasser Mohamed
// Create Date: 28/9/2023 
// Module Name: Main Decoder
// Project Name: Mips Processor

module main_decoder
(
	input [5:0]Opcode,
	output reg MemtoReg,
	output reg ALUSrc,
	output reg RegDst,
	output reg RegWrite,
	output reg Branch,
	output reg [1:0]ALUOp,
	output reg Jump,
	output reg MemWrite
);
localparam lw=6'b10_0011,sw=6'b10_1011,Rtype=6'b00_0000,addi=6'b00_1000,beq=6'b00_0100,Jalandj=6'b00_0010;
always@(*)
begin
	case(Opcode)
		lw:
		begin
			Jump=0;
			ALUOp=2'b00;
			Branch=0;
			RegWrite=1;
			RegDst=0;
			ALUSrc=1;
			MemtoReg=1;
			MemWrite=0;
		end
		sw:
		begin
			Jump=0;
			ALUOp=2'b00;
			Branch=0;
			RegWrite=0;
			RegDst=0;
			ALUSrc=1;
			MemtoReg=1;
			MemWrite=1;
		end
		Rtype:
		begin
			Jump=0;
			ALUOp=2'b10;
			Branch=0;
			RegWrite=1;
			RegDst=1;
			ALUSrc=0;
			MemtoReg=0;
			MemWrite=0;
		end
		addi:
		begin
			Jump=0;
			ALUOp=2'b00;
			Branch=0;
			RegWrite=1;
			RegDst=0;
			ALUSrc=1;
			MemtoReg=0;
			MemWrite=0;
		end
		beq:
		begin
			Jump=0;
			ALUOp=2'b01;
			Branch=1;
			RegWrite=0;
			RegDst=0;
			ALUSrc=0;
			MemtoReg=0;
			MemWrite=0;
		end
		Jalandj:
		begin
			Jump=1;
			ALUOp=2'b00;
			Branch=0;
			RegWrite=0;
			RegDst=0;
			ALUSrc=0;
			MemtoReg=0;
			MemWrite=0;
		end
		default:
		begin
			Jump=0;
			ALUOp=2'b00;
			Branch=0;
			RegWrite=0;
			RegDst=0;
			ALUSrc=0;
			MemtoReg=0;
			MemWrite=0;
		end
endcase

end
endmodule