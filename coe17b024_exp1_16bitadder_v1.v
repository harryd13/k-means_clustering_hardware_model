`include "coe17b024_exp1_8bitadder_v1.v"
module sxtnBitAdder (a,b,cin,sum, ca);
input[15:0] a, b;
input cin;
output[15:0] sum;
output ca;
wire w0;
	
	EightBitAdder EBA_0(a[7:0],b[7:0],cin,sum[7:0],w0);
	EightBitAdder EBA_1(a[15:8],b[15:8],w0 ,sum[15:8],ca);
	
	
endmodule
