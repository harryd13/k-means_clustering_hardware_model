module Partial (A, B, out);
	input [7:0] A;
	input B;
	output [7:0] out;
	assign out[0] = A[0]&B;
	assign out[1] = A[1]&B;
	assign out[2] = A[2]&B;
	assign out[3] = A[3]&B;
	assign out[4] = A[4]&B;
	assign out[5] = A[5]&B;
	assign out[6] = A[6]&B;
	assign out[7] = A[7]&B;

endmodule