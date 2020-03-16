`include "coe17b024_exp1_FullAdder_v1.v"
module FourBitAdder (a,b,cin,sum, ca);
input[3:0] a, b;
input cin;
output[3:0] sum;
output ca;
wire w0,w1,w2;
	
	FullAdder FA_0(a[0],b[0],cin,sum[0],w0);
	FullAdder FA_1(a[1],b[1],w0 ,sum[1],w1);
	FullAdder FA_2(a[2],b[2],w1 ,sum[2],w2);
	FullAdder FA_3(a[3],b[3],w2 ,sum[3],ca);
	
endmodule
