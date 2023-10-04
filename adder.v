// Engineer: Yasser Mohamed
// Create Date: 28/9/2023 
// Module Name: Adder
// Project Name: Mips Processor

module adder #(parameter n_bits = 32)
(
	input [n_bits-1:0]input1,input2,
	output [n_bits-1:0]out
);

assign out=input1+input2;
endmodule