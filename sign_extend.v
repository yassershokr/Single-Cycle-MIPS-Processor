// Engineer: Yasser Mohamed
// Create Date: 28/9/2023 
// Module Name: Sign Extend
// Project Name: Mips Processor

module sign_extend #(parameter n_bits = 32)
(
	input [15:0]inp,
	output [n_bits-1:0]out
);

assign out = inp[15]? {~16'b0,inp}:{16'b0,inp};
endmodule