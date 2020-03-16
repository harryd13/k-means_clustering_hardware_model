`include "FullAdder_1.v"
`include "HalfAdder.v"
module Wallace (a,b,out);
input [7:0]a,b;
output [15:0]out;
reg c[7:0][7:0];
wire [55:1]sum;
wire [55:1]ca;
wire [10:0]d;
integer i,j;
always @* begin
for( i=0;i<8;i++)
begin
	for(j=0;j<8;j++)
	begin
		if(b[i]==0)
		c[i][j]=1'b0;
		else 
		c[i][j]=a[j];
	end
end	
	
end
//8 paritial products
assign out[0]=c[0][0];
HalfAdder h1(c[0][1],c[1][0],sum[1],ca[1]);
FullAdder1 f1(c[0][2],c[1][1],c[2][0],sum[2],ca[2]);
FullAdder1 f2(c[0][3],c[1][2],c[2][1],sum[3],ca[3]);
FullAdder1 f3(c[0][4],c[1][3],c[2][2],sum[4],ca[4]);
FullAdder1 f4(c[0][5],c[1][4],c[2][3],sum[5],ca[5]);	
FullAdder1 f5(c[0][6],c[1][5],c[2][4],sum[6],ca[6]);
FullAdder1 f6(c[0][7],c[1][6],c[2][5],sum[7],ca[7]);
HalfAdder h2(c[1][7],c[2][6],sum[8],ca[8]);
 
FullAdder1 f7(c[2][7],c[3][6],c[4][5],sum[9],ca[9]);
HalfAdder h3(c[3][1],c[4][0],sum[10],ca[10]);
FullAdder1 f11(c[3][2],c[4][1],c[5][0],sum[11],ca[11]);
FullAdder1 f8(c[3][3],c[4][2],c[5][1],sum[12],ca[12]);
FullAdder1 f9(c[3][4],c[4][3],c[5][2],sum[13],ca[13]);
FullAdder1 f10(c[3][5],c[4][4],c[5][3],sum[14],ca[14]);	
FullAdder1 f12(c[3][7],c[4][6],c[5][5],sum[15],ca[15]);
HalfAdder h4(c[4][7],c[5][6],sum[16],ca[16]);


//6 partial products
HalfAdder h5(sum[2],ca[1],sum[17],ca[17]);
FullAdder1 f13(sum[3],ca[2],c[3][0],sum[18],ca[18]);
FullAdder1 f14(sum[4],ca[3],sum[10],sum[19],ca[19]);
FullAdder1 f15(sum[5],ca[4],sum[11],sum[20],ca[20]);
FullAdder1 f16(sum[6],ca[5],sum[12],sum[21],ca[21]);
FullAdder1 f17(sum[7],ca[6],sum[13],sum[22],ca[22]);
FullAdder1 f18(sum[8],ca[7],sum[14],sum[23],ca[23]);
FullAdder1 f19(ca[14],sum[9],ca[8],sum[24],ca[24]);

HalfAdder h6(ca[11],c[6][0],sum[25],ca[25]);
FullAdder1 f20(ca[12],c[6][1],c[7][0],sum[26],ca[26]);
FullAdder1 f21(ca[13],c[6][2],c[7][1],sum[27],ca[27]);
FullAdder1 f22(c[5][4],c[6][3],c[7][2],sum[28],ca[28]);
FullAdder1 f23(ca[9],c[6][4],c[7][3],sum[29],ca[29]);
FullAdder1 f24(ca[15],c[6][5],c[7][4],sum[30],ca[30]);
FullAdder1 f25(c[5][7],c[6][6],c[7][5],sum[31],ca[31]);
HalfAdder h7(c[6][7],c[7][6],sum[32],ca[32]);

//4 partial products
HalfAdder h8(sum[18],ca[17],sum[33],ca[33]);
HalfAdder h9(sum[19],ca[18],sum[34],ca[34]);
FullAdder1 f26(sum[20],ca[19],ca[10],sum[35],ca[35]);
FullAdder1 f27(sum[21],ca[20],sum[25],sum[36],ca[36]);
FullAdder1 f28(sum[22],ca[21],sum[26],sum[37],ca[37]);
FullAdder1 f29(sum[23],ca[22],sum[27],sum[38],ca[38]);
FullAdder1 f30(sum[24],ca[23],sum[28],sum[39],ca[39]);
FullAdder1 f31(sum[15],ca[24],sum[29],sum[40],ca[40]);
HalfAdder h10(sum[16],sum[30],sum[41],ca[41]);
HalfAdder h11(ca[16],sum[31],sum[42],ca[42]);

//3 partial products
HalfAdder h12(ca[33],sum[34],sum[43],ca[43]);
HalfAdder h13(ca[34],sum[35],sum[44],ca[44]);
HalfAdder h14(ca[35],sum[36],sum[45],ca[45]);
FullAdder1 f32(sum[37],ca[36],ca[25],sum[46],ca[46]);
FullAdder1 f33(sum[38],ca[37],ca[26],sum[47],ca[47]);
FullAdder1 f34(sum[39],ca[38],ca[27],sum[48],ca[48]);
FullAdder1 f35(sum[40],ca[39],ca[28],sum[49],ca[49]);
FullAdder1 f36(sum[41],ca[40],ca[29],sum[50],ca[50]);
FullAdder1 f37(sum[42],ca[41],ca[30],sum[51],ca[51]);
FullAdder1 f38(ca[42],sum[32],ca[31],sum[52],ca[52]);
HalfAdder h15(c[7][7],ca[32],sum[53],ca[53]);

assign out[1]=sum[1];
assign out[2]=sum[17];
assign out[3]=sum[33];
assign out[4]=sum[43];
HalfAdder h16(sum[44],ca[43],out[5],d[0]);
FullAdder1 f39(sum[45],ca[44],d[0],out[6],d[1]);
FullAdder1 f40(sum[46],ca[45],d[1],out[7],d[2]);
FullAdder1 f41(sum[47],ca[46],d[2],out[8],d[3]);
FullAdder1 f42(sum[48],ca[47],d[3],out[9],d[4]);
FullAdder1 f43(sum[49],ca[48],d[4],out[10],d[5]);
FullAdder1 f44(sum[50],ca[49],d[5],out[11],d[6]);
FullAdder1 f45(sum[51],ca[50],d[6],out[12],d[7]);
FullAdder1 f46(sum[52],ca[51],d[7],out[13],d[8]);
FullAdder1 f47(sum[53],ca[52],d[8],out[14],d[9]);
HalfAdder h17(d[9],ca[53],out[15],d[10]);
endmodule
