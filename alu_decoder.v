// Engineer: Yasser Mohamed
// Create Date: 28/9/2023 
// Module Name: ALU Decoder
// Project Name: Mips Processor

module alu_decoder
(
	input [5:0] Funct,
	input [1:0] ALUOp,
  	output reg [2:0] ALUControl
);
always @(*) 
begin
  ALUControl=3'b0;
  casex ({ALUOp,Funct})
    8'b00xxxxxx:
	begin
      	ALUControl= 010;
    	end 
    8'b01xxxxxx:
	begin
      	ALUControl=100;
    	end
    8'b10100000:
	begin
      	ALUControl=010;
    	end
    8'b10100010:
	begin
      	ALUControl=100;
   	end
    8'b10101010:
	begin
      	ALUControl=110;
    	end
    8'b10011100:
	begin
      	ALUControl=101;
    	end
    default: 
	begin
      	ALUControl=010;
    end
  endcase
end
  
endmodule