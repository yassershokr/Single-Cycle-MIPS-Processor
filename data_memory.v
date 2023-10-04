// Engineer: Yasser Mohamed
// Create Date: 28/9/2023 
// Module Name: Data Memory
// Project Name: Mips Processor

module data_memory #(parameter n_bits = 32)
(
	input clk,
	input [n_bits-1:0]A,
	input [n_bits-1:0]WD,
	input WE,
	output reg [n_bits-1:0]RD,
	output [15:0]test_value
);
reg [n_bits-1:0]RAM[255:0];
integer i;

initial 
begin 
    RD='b0; 
    for(i=0;i<256;i=i+1)  
         RAM[i] <= 32'b0;  
end 
always @(posedge clk) 
begin
  	if (WE) 
	begin
    	   RAM[A] <= WD;
  	end 
	else 
	begin
     	   RAM[A]<=RAM[A];
  	end

end
always @(*)
begin
  	if(~WE)
	begin
    	   RD <= RAM[A];
  	end 
	else 
	begin
    	   RD <= RD;
  	end

end

	assign test_value=RD[15:0];

endmodule