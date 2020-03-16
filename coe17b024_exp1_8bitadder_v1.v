`include "coe17b024_exp1_4bitadder_v1.v"
module EightBitAdder (a,b,cin,sum, ca);
input[7:0] a, b;
input cin;
output[7:0] sum;
output ca;
wire w0;
	
	FourBitAdder FBA_0(a[3:0],b[3:0],cin,sum[3:0],w0);
	FourBitAdder FBA_1(a[7:4],b[7:4],w0 ,sum[7:4],ca);
	
	
endmodule
