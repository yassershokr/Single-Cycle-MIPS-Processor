// Engineer: Yasser Mohamed
// Create Date: 28/9/2023 
// Module Name: ALU
// Project Name: Mips Processor

module alu #(parameter n_bits =32)
(
	input [n_bits-1:0] srca,srcb,
	input [2:0] ALUControl,
	output reg Zero,
	output reg [n_bits-1:0]ALUResult	
);
reg [2*n_bits-1:0]multi;
always@(*)
begin
ALUResult='b0;
Zero='b1;
multi='b0;
case(ALUControl)
	3'b000:
		begin
		ALUResult = srca & srcb;
		if (ALUResult) begin
        		Zero = 0 ;
      		end 
		else begin
        		Zero=1 ;
      		     end
		end
	3'b001:
		begin
		ALUResult = srca | srcb;
		if (ALUResult) begin
        		Zero = 0 ;
      		end 
		else begin
        		Zero=1 ;
      		     end
		end
	3'b010:
		begin
		ALUResult = srca + srcb;
		if (ALUResult) begin
        		Zero = 0 ;
      		end 
		else begin
        		Zero=1 ;
      		     end
		end
	3'b100:
		begin
		ALUResult = srca - srcb;
		if (ALUResult) begin
        		Zero = 0 ;
      		end 
		else begin
        		Zero=1 ;
      		     end
		end
	3'b101:
		begin
		multi = srca * srcb;
		ALUResult = multi[n_bits-1:0];
		if (ALUResult) begin
        		Zero = 0 ;
      		end 
		else begin
        		Zero=1 ;
      		     end
		end
	3'b110:
		begin
		if(srca < srcb)begin
		ALUResult='b1;
		end
		else begin
		ALUResult='b0;
		end
		if (ALUResult) begin
        		Zero = 0 ;
      		end 
		else begin
        		Zero=1 ;
      		     end
		end
	default:
		begin
		ALUResult='b0;
		Zero=1;
		end

endcase
end
endmodule