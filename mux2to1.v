// Engineer: Yasser Mohamed
// Create Date: 28/9/2023 
// Module Name: Mux 2 to 1
// Project Name: Mips Processor

module mux2to1 #(parameter n_bit=32) 
(
  input [n_bit-1 : 0] input0,input1,
  input sel,
  output [n_bit-1 : 0] out
);
assign out = sel? input1:input0 ;
endmodule 

