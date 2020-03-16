`include "coe17b024_exp1_32bitadder_v1.v"
module sxtfBitAdder (a,b,cin,sum, ca);
input[63:0] a, b;
input cin;
output[63:0] sum;
output ca;
wire w0;
	
	ThrtBitAdder sBA_0(a[31:0],b[31:0],cin,sum[31:0],w0);
	ThrtBitAdder sBA_1(a[63:32],b[63:32],w0 ,sum[63:32],ca);
	
	
endmodule
