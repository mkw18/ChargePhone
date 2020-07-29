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
		#60;
		C = 4'b1111;
		#40;
		C = 4'b1101;
		#60;
		C = 4'b1111;
		#40;
		C = 4'b1011;
		#60;
		C = 4'b1111;
		#40;
		C = 4'b0111;
		#60;
		C = 4'b1111;
		#42;//第一个循环
		C = 4'b1110;
		#60;
		C = 4'b1111;
		#40;
		C = 4'b1101;
		#60;
		C = 4'b1111;
		#40;
		C = 4'b1011;
		#60;
		C = 4'b1111;
		#40;
		C = 4'b0111;
		#60;
		C = 4'b1111;
		#42;//第二个循环
		C = 4'b1110;
		#60;
		C = 4'b1111;
		#40;
		C = 4'b1101;
		#60;
		C = 4'b1111;
		#40;
		C = 4'b1011;
		#60;
		C = 4'b1111;
		#40;
		C = 4'b0111;
		#60;
		C = 4'b1111;
		#42;//第三个循环
		C = 4'b1110;
		#60;
		C = 4'b1111;
		#40;
		C = 4'b1101;
		#60;
		C = 4'b1111;
		#40;
		C = 4'b1011;
		#60;
		C = 4'b1111;
		#40;
		C = 4'b0111;
		#100;//长按键
		C = 4'b1111;
		#40;
		C = 4'b1110;
		#40;
		C = 4'b1011;
		#2;
		C = 4'b1110;//按键防抖
	end
endmodule