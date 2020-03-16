`include "wallace.v"
`include "FullAdder8.v"

module Wallace16bit(A,B,out);

	input [15:0] A,B;
	output [35:0] out;

	wire [15:0] pp1,pp2,pp3,pp4;
	Wallace w1(A[7:0],B[7:0],pp1); 
	Wallace w2(A[15:8],B[7:0],pp2);
	Wallace w3(A[7:0],B[15:8],pp3);
	Wallace w4(A[15:8],B[15:8],pp4);

	assign out[7:0] = pp1[7:0];
	
	wire c1,c2,c3,c4;
	wire [7:0] temp1,temp2;
	FA8 F1 (pp1[15:8],pp2[7:0],1'b0,temp1,c1);
	FA8 F2 (temp1,pp3[7:0],1'b0,out[15:8],c2);

	FA8 F3 (pp2[15:8],pp3[15:8],c1,temp2,c3);
	FA8 F4 (temp2,pp4[7:0],c2,out[23:16],c4);

	wire [7:0] ca1;
	assign ca1[0] = c3;
	assign ca1[7:1] = 7'd0;

	FA8 F5 (pp4[15:8],ca1,c4,out[31:24],c5);
	assign out[35:32] = 4'd0;
endmodule


	