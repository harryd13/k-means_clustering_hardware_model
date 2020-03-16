`include "MAC.v"

module top;

	reg [15:0] A,B;
	reg clk,reset;

	wire [35:0] out;

	MAC m(A,B,out,clk,reset);

	initial
	begin
		reset=1;
		clk = 0;
		A = {$random}%65535; B= {$random}%65535;
		#5 reset=0;
	end
	//initial begin
	//	A = ($random)%65535; B= ($random)%65535;
	//end

	always begin
	#5  clk =  ~clk; 
	end
	always begin
		#10 A = {$random}%65535; B= {$random}%65535;
	end

	initial begin
		$monitor($time,"clk = %d reset = %d ||A  ->%d B  ->%d || ANS -> %d",clk,reset,A,B,out);
		#100 $finish;
	end
endmodule
