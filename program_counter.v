// Engineer: Yasser Mohamed
// Create Date: 28/9/2023 
// Module Name: Program Counter
// Project Name: Mips Processor

module Program_Counter #(parameter n_bit=32)
(
  input clk,reset_n,
  input [n_bit-1 : 0] PC_dash,
  output [n_bit-1 : 0] PC

);
reg [n_bit-1 : 0] Q_reg,Q_next;

always @(posedge clk,negedge reset_n) 
begin
if (~reset_n) 
	begin
  	   Q_reg <= 'b0;
	end 
else 
	begin
  	   Q_reg <= Q_next;
	end
end

always @(*) 
begin
  Q_next = PC_dash;
end

assign PC = Q_reg;

endmodule
