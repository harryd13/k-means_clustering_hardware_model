module FullAdder1(A,B,Cin,sum,C);                                                                            
	input A,B,Cin;
	output sum,C;
	
	assign sum = A ^ B ^ Cin;
	assign C = ((A ^ B)&Cin) | (A&B);
	
endmodule
