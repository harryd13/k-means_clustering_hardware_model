`include "FullAdder.v"

module FA4(A,B,Cin,Sum,Carry);

	input [3:0] A,B;
	input Cin;

	output [3:0] Sum;
	output Carry;
	wire w0,w1,w2;
	FullAdder fa0 (A[0],B[0],Cin,Sum[0],w0);
	FullAdder fa1 (A[1],B[1],w0,Sum[1],w1);
	FullAdder fa2 (A[2],B[2],w1,Sum[2],w2);
	FullAdder fa3 (A[3],B[3],w2,Sum[3],Carry);

endmodule
