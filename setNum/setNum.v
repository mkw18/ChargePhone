module setNum (C,R,startSet,num,start,clear,enter);
   input [3:0] C;
	input [3:0] R;
	input startSet;
	output reg [4:0] num;
	output reg start;
	output reg clear;
	output reg enter;
	reg [4:0] key;
	initial
	   begin
		num<=20;
		start<=0;
		clear<=0;
		enter<=0;
		end
		
	always @ (posedge startSet)  //完全解决长按键问题
	   begin
		num<=20;
		start<=0;
		clear<=0;
		enter<=0;
		case(R)
		   4'b1110:key=0;
			4'b1101:key=4;
			4'b1011:key=8;
			4'b0111:key=12;
		endcase
		case(C)
		   4'b1110:key=key+1;
			4'b1101:key=key+2;
			4'b1011:key=key+3;
			4'b0111:key=key+4;
		endcase
		case(key)
		   1:num<=1;
			2:num<=2;
			3:num<=3;
			4:num<=4;
			5:num<=5;
			6:num<=6;
			7:num<=7;
			8:num<=8;
			9:num<=9;
			10:num<=0;
			11:start<=1;
			12:clear<=1;
			13:enter<=1;
			default:
			   begin
				num<=20;
				start<=0;
				clear<=0;
				enter<=0;
				end
		endcase
		end
endmodule