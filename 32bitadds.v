`include "coe17b024_exp1_16bitadder_v1.v"
module ThrtBitAdder (a,b,cin,sum, ca);
input[31:0] a, b;
input cin;
output[31:0] sum;
output ca;
wire w0;
	
	sxtnBitAdder sBA_0(a[15:0],b[15:0],cin,sum[15:0],w0);
	sxtnBitAdder sBA_1(a[31:16],b[31:16],w0 ,sum[31:16],ca);
	
	
endmodule
