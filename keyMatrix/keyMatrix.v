module keyMatrix(CLK,C,R,startSet,num,start,clear,enter);
   input CLK;
	input [3:0] C;
	output reg [3:0] R;
	output reg startSet;
	output reg [4:0] num;
	output reg start;
	output reg clear;
	output reg enter;
	reg [4:0] key;
	
	reg [1:0] round;
	reg isPush;
	reg [13:0] negCnt;
	reg [13:0] posCnt;
	
	initial
	   begin
		R<=4'b0;
		startSet<=1'b0;
		round<=2'b0;
		isPush<=1'b0;
		negCnt<=4'b0;
		posCnt<=4'b0;
		num<=20;
		start<=0;
		clear<=0;
		enter<=0;
		end
	
	always @ (posedge CLK)
	   begin
	   if (!isPush)
		begin
			if (C==4'b1111)
			begin
				startSet<=0;
				posCnt<=0;
				case (round)
				0: R=4'b0111;
				1: R=4'b1011;
				2: R=4'b1101;
				3: R=4'b1110;
				endcase
				round=round+1;
			end
			else isPush<=1;
		end
		else
		begin
			if (C==4'b1111)
			begin
				negCnt<=0;
				if(posCnt<4000) posCnt=posCnt+1;
				else isPush<=0;
			end
			else if (negCnt<4000) negCnt=negCnt+1;
			else 
			begin
				startSet=1;
				negCnt<=0;
				posCnt<=0; //防抖
			end
		end
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