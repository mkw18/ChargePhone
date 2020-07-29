module DigChoose (CLK,money,restime,dig,num);
   input CLK;
	input [7:0] money;
	input [7:0] restime;
	output reg [3:0] dig;
	output reg [3:0] num;
	
	initial
	   dig <= 4'b0001;
	
	always @ (posedge CLK)
	begin
	   if (money == 8'hff)
		begin
		   dig <= 4'b0001;
			num <= 4'b1111;
		end
		else
		begin
		   case(dig)
			   4'b0001:
				begin
					dig <= 4'b0010;
				   num <= money % 10;
				end
				4'b0010:
				begin
					dig <= 4'b0100;
				   num <= money / 10;
				end
				4'b0100:
				begin
					dig <= 4'b1000;
				   num <= restime % 10;
				end
				4'b1000:
				begin
					dig <= 4'b0001;
					num <= restime / 10;
				end
				default
				begin
					dig = 4'b0001;
					num = 4'b1111;
				end
			endcase
		end
	end
endmodule
