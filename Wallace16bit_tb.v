`include "Wallace16bit.v"
module top1;

    reg [15:0] A, B;

    wire [35:0] out;

   Wallace16bit w(A, B, out);

    initial begin
     A = 3916;
     B = 3916;
	
        
    end
      
    initial
        $monitor("%d",out);

endmodule
