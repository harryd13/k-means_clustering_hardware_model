module DFlipFlop(d,clk,reset,q);

	input [35:0] d;
	input clk, reset;
	output reg [35:0] q;

	always @(posedge clk or posedge reset)
	begin
		if(reset)
 			q <= 36'd0;
		else
			q <= d;
	end
	
endmodule
