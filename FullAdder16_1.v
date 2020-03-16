`include "FullAdder4_1.v"

module FA16(A,B,Cin,Sum,Carry);

	input [15:0] A,B;
	input Cin;

	output [15:0] Sum;
	output Carry;
	wire w0,w1,w2;
	FA4_1 fa4_0 (A[3:0],B[3:0],Cin,Sum[3:0],w0);
	FA4_1 fa4_1 (A[7:4],B[7:4],w0,Sum[7:4],w1);
	FA4_1 fa4_2 (A[11:8],B[11:8],w1,Sum[11:8],w2);
	FA4_1 fa4_3 (A[15:12],B[15:12],w2,Sum[15:12],Carry);

endmodule
