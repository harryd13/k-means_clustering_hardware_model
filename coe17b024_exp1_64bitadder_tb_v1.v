`include "coe17b024_exp1_64bitadder_v1.v"

module top;

reg[63:0] a, b;
reg cin;
wire[63:0] sum;
wire ca;

     sxtfBitAdder SxBA_0(a,b,cin,sum,ca);

initial
begin
	a=0;
	b=0;
	cin=1;
	#100 
	a =1;
	b = 16;
	cin = 0;
	#100
	a = 500;
	b = 3;
	cin = 0;
end

initial
begin
	$monitor($time, "a = %d, b = %d,cin = %d, Sum = %d, ca = %d",a,b,cin,sum, ca);
	$dumpfile("64bit.vcd");
	$dumpvars;
end

endmodule
