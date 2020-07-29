module mechine_save(CLK,startSet,num,start,clear,enter,money,restime);
   input CLK,startSet,start,clear,enter;
	input [4:0] num;
	output reg [7:0] money;
	output reg [7:0] restime;
	
	parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
	parameter second = 25000;
	parameter pause = 250000;
	
	reg [1:0] state;
	reg timer;
	reg [17:0] pause_count;
	reg [14:0] time_count;
	
	reg [7:0]next_money;
	reg last_set;
	wire set = ((last_set != startSet) && startSet);
	reg reset;
//	assign next_money = (money * 10 + num) % 100;
	
	initial
	begin
	   state <= S0;
		timer <= 0;
		pause_count <= 0;
		time_count <= 0;
		money <= 8'hff;
		restime <= 8'hff;
		reset = 0;
	end
	
	always @ (posedge CLK)
	begin
	   case (state)
		S0:
		begin
		   if (set)
			begin
			   if (start)
				begin
					state <= S1;
					money <= 0;
					restime <= 0;
					timer <= 1;
				end
				else
				   state <= S0;
			end
			else
			begin
			   state <= S0;
				money <= 8'hff;
				restime <= 8'hff;
			end
		end
		S1:
		begin
		   if (money == 8'hff && restime == 8'hff)
			   state <= S0;
			else
			begin
			   if (set)
				begin
				   if (enter)
					   state <= S2;
					else
					begin
					   state <= S1;
						if (clear || start)
						begin
						   if (clear)
							begin
							   money <= 0;
								restime <= 0;
							end
							else
							begin
							   if (money == 8'hff && restime == 8'hff)
								begin
								   money <= 0;
									restime <= 0;
								end
							end
							reset = 1;
							timer <= 1;
							pause_count <= 0;
						end
						else if (num < 10)
						begin
						   timer <= 0;
							pause_count <= 0;
							next_money = (money * 10 + num) % 100;
//							money <= (money * 10 + num) % 100;
							if (next_money > 20)
							begin
							   money <= 20;
								restime <= 40;
							end
							else
							begin
								money <= next_money;
								restime <= next_money * 2;
							end
						end
					end
				end
				if (timer && (!reset))
				begin
				   if (pause_count < pause)
					   pause_count <= pause_count + 1;
					else
					begin
					   pause_count <= pause + 1;
						state <= S0;
						timer <= 0;
						pause_count <= 0;
					end
				end
			end
		end
		S2:
		begin
			if (restime == 0)
				money <= 0;
			else
			begin
				if (time_count < second)
					time_count <= time_count + 1;
				else
					time_count <= 0;
				if (time_count == second - 1)
				begin
					if (restime != 0)
						restime <= restime - 1;
					if (restime == 1)
						money <= 0;
				end
			end
			if (money == 0)
			begin
			   state <= S1;
				timer <= 1;
				pause_count <= 0;
			end
		end
		endcase
		last_set <= startSet;
	end
endmodule