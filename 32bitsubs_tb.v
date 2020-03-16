`include "32bitsubs.v"

module top;

reg[31:0] a, b;
wire[31:0] d;
reg cin;
wire[31:0] dif;
wire ca;
assign d = ~b;

     ThrtBitAdder SBA_0(a,d,cin,dif,ca);

initial
begin
     a = 6316;
     b = 2400;
	cin = 1;
end

initial
begin
    $monitor("%d",dif);
	// $monitor($time, "a = %d, b = %d,cin = %b, Sum = %d, ca = %b",a,b,cin,sum, ca);
	// $dumpfile("32bit.vcd");
	// $dumpvars;
end

endmodule