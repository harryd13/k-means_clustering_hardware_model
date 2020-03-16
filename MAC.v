`include "Wallace16bit.v"
`include "FullAdder36.v"
`include "dflipflop.v"
module MAC(A,B,out,clk,reset);

	input [15:0] A,B;
	input clk,reset;
	output [35:0] out;

	wire [35:0] out1,temp;
	Wallace16bit w(A,B,out1);

	DFlipFlop d1 (out1,clk,reset,temp);

	wire [35:0] sumt,outff;
	wire c;

	FA36 fa (temp,outff,out,c);
	DFlipFlop d2 (out,clk,reset,outff);

endmodule