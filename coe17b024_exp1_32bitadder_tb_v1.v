`include "coe17b024_exp1_32bitadder_v1.v"

module top;

reg[31:0] a, b;
reg cin;
wire[31:0] sum;
wire ca;

     ThrtBitAdder SBA_0(a,b,cin,sum,ca);

initial
begin
	a=0;
	b=0;
	cin=1;
	#100 
	a =512;
	b = 16;
	cin = 0;
	#100
	a =256;
	b = 0;
	cin = 1;
end

initial
begin
	$monitor($time, "a = %d, b = %d,cin = %b, Sum = %d, ca = %b",a,b,cin,sum, ca);
	$dumpfile("32bit.vcd");
	$dumpvars;
end

endmodule
