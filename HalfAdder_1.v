module HalfAdder(A,B,sum,C);                                                                            
	input A,B;
	output sum,C;
	
	assign sum = A ^ B;
	assign C = (A & B);
	
endmodule
