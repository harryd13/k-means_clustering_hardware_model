`include "32bitadds.v"

module top;

reg[31:0] a, b;
reg cin;
wire[31:0] sum;
wire ca;

     ThrtBitAdder SBA_0(a,b,cin,sum,ca);

initial
begin
     a = 15335056;
     b = 4840000;
	cin = 0;
end

initial
begin
    $monitor("%d",sum);
	// $monitor($time, "a = %d, b = %d,cin = %b, Sum = %d, ca = %b",a,b,cin,sum, ca);
	// $dumpfile("32bit.vcd");
	// $dumpvars;
end

endmodule
