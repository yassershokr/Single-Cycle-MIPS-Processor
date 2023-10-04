// Engineer: Yasser Mohamed
// Create Date: 28/9/2023 
// Module Name: Shift left 2
// Project Name: Mips Processor

module shift_left_2 #(parameter n_bits_in = 4,n_bits_out = 6)
( 
	input [n_bits_in-1:0]in,
	output [n_bits_out-1:0]out
);
	assign out = in<<2;
endmodule