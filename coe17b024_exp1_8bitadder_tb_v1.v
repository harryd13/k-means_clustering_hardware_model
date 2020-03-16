`include "coe17b024_exp1_8bitadder_v1.v"

module top;

reg[7:0] a, b;
reg cin;
wire[7:0] sum;
wire ca;

     EightBitAdder EBA_0(a,b,cin,sum,ca);

initial
begin
	a=0;
	b=0;
	cin=1;
	#100 
	a = 32;
	b = 16;
	cin = 0;
	#100
	a =128;
	b = 0;
	cin = 1;
end

initial
begin
	$monitor($time, "a = %d, b = %d,cin = %b, Sum = %d, ca = %b",a,b,cin,sum, ca);
	$dumpfile("8bit.vcd");
	$dumpvars;
end

endmodule
