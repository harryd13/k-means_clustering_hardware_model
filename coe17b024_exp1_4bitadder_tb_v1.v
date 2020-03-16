`include "coe17b024_exp1_4bitadder_v1.v"

module top;

reg[3:0] a, b;
reg cin;
wire[3:0] sum;
wire ca;

     FourBitAdder FBA_0(a,b,cin,sum,ca);

initial
begin
	a=0;
	b=0;
	cin=1;
	#100 
	a = 4;
	b = 2;
	cin = 0;
	#100
	a =0;
	b = 3;
	cin = 1;
end

initial
begin
	$monitor($time, "a = %d, b = %d,cin = %b, Sum = %d, ca = %b",a,b,cin,sum, ca);
	$dumpfile("Frbit.vcd");
	$dumpvars;
end

endmodule
