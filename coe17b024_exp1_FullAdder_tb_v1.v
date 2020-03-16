`include "coe17b024_exp1_FullAdder_v1.v"

module top;

reg a, b,cin;
wire sum, ca;

     FullAdder FA_0(a,b,cin,sum,ca);

initial
begin
	a=0;
	b=0;
	cin=0;
	#10 cin=1;
	#10 b=1;
	#10 cin = 0;
	#10 a=1;
	#10 cin=1;
	#10 b=1;
	#10 cin = 0;
end

initial
begin
	$monitor($time, "a = %b, b = %b,cin = %b, Sum = %b, ca = %b",a,b,cin,sum, ca);
	$dumpfile("FullAdder.vcd");
	$dumpvars;
end

endmodule
