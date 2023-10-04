// Engineer: Yasser Mohamed
// Create Date: 28/9/2023 
// Module Name: Instruction Memory
// Project Name: Mips Processor

module instrution_memory #(parameter n_bits = 32)
(
	input [7:0]A,
	output reg [n_bits-1:0]RD
);
reg [n_bits-1:0] ROM [255:0]; 
integer i;

initial begin
  RD ='b0;
  ROM[0] =32'h00008020 ;
  ROM[1] =32'h20100078 ;
  ROM[2] =32'h00008820 ;
  ROM[3] =32'h201100B4 ;
  ROM[4] =32'h00009020 ;
  ROM[5] =32'h12110006 ;
  ROM[6] =32'h0211482A ;
  ROM[7] =32'h11200002 ;
  ROM[8] =32'h02308822 ;
  ROM[9] =32'h08000005 ;
  ROM[10] =32'h02118022 ;
  ROM[11] =32'h08000005 ;
  ROM[12] =32'h00109020 ;
  ROM[13] =32'hAC120000 ;
  for (i =14 ;i<256 ;i=i+1 ) begin
    ROM[i]=32'b0;
  end
end
/*
initial
begin
RD='b0;
ROM[0]=32'h00008020;
ROM[1]=32'h20100007;
ROM[2]=32'h00008820;ROM[3]=32'h20110001;ROM[4]=32'h12000003;ROM[5]=32'h0230881C;ROM[6]=32'h2210FFFF;ROM[7]=32'h08000004;ROM[8]=32'hAC110000;
for (i =9 ;i<256 ;i=i+1 ) 
begin
    ROM[i]=32'b0;
end
end
*/
always@(*)
begin
    RD = ROM[A];
end
endmodule

