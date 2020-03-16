`include "64bitsubs.v"

module top;

reg[63:0] a, b;
wire[63:0] d;
reg cin;
wire[63:0] dif;
wire ca;
assign d = ~b;

     sxtfBitAdder SxBA_0(a,d,cin,dif,ca);

initial
begin
	
	a = 5000000;
	b = 3000000;
	cin = 1;
end

initial
begin
	//$monitor($time, "a = %d, b = %d,cin = %d, Sum = %d, ca = %d",a,b,cin,dif, ca);
	$monitor("%d",dif);
	//$dumpfile("64bitsub.vcd");
	//$dumpvars;
end

endmodule
