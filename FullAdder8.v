`include "FullAdder4_2.v"

module FA8(A,B,Cin,Sum,Carry);

	input [7:0] A,B;
	input Cin;

	output [7:0] Sum;
	output Carry;
	wire w0;
	FA4_2 fa4_0 (A[3:0],B[3:0],Cin,Sum[3:0],w0);
	FA4_2 fa4_1 (A[7:4],B[7:4],w0,Sum[7:4],Carry);
	

endmodule
