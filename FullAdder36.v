`include "FullAdder16_1.v"
`include "FullAdder4.v"


module FA36(A,B,Sum,Carry);

	input [35:0] A,B;
	//input Cin;

	output [35:0] Sum;
	output Carry;
	wire w0,w1;
	FA16 fa36_0 (A[15:0],B[15:0],1'b0,Sum[15:0],w0);
	FA16 fa36_1 (A[31:16],B[31:16],w0,Sum[31:16],w1);
	FA4 fa36_2 (A[35:32],B[35:32],w1,Sum[35:32],Carry);
	

endmodule
