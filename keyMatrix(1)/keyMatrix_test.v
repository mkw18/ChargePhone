`timescale 10 ns / 1 ns

module keyMatrix_test;

	reg CLK;
	reg [3:0] C;

	wire [3:0] R;
	wire [4:0] num;
	wire startSet,start,clear,enter;

	keyMatrix km(CLK,C,R,startSet,num,start,clear,enter);
	
	always #1
		CLK = ~CLK;
	
	initial
	begin
		C = 4'b1111;
		CLK = 0;
		#40;
		C = 4'b1110;
		#20;
		C = 4'b1011;
		#2;
		C = 4'b1110;
		#40;//按下防抖
		C = 4'b1111;
		#20;
		C = 4'b1011;
		#2;
		C = 4'b1111;
		#40;//抬起防抖
		C = 4'b0111;
		#100;//长按键
		C = 4'b1111;
	end
endmodule