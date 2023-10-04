// Engineer: Yasser Mohamed
// Create Date: 28/9/2023 
// Module Name: Register File
// Project Name: Mips Processor

module register_file #(parameter n_bits = 32)
(
	input clk,
	input [n_bits-1:0]WD3,
	input [4:0]A1,A2,A3,
	input WE3,
	output [n_bits-1:0]RD1,RD2
);
reg [n_bits-1:0] registers [n_bits-1:0];
integer i;
initial
begin
  for ( i=0 ;i<32 ;i=i+1 ) 
	begin
   	 registers[i] = 32'b0;
  	end
end
always @(posedge clk)
begin   
  if (WE3) 
  begin
    registers[A3] <= WD3;
  end 
  else 
  begin
    registers[A3]<=registers[A3];
  end

end
assign RD1=registers[A1];
assign RD2=registers[A2];
  
endmodule


