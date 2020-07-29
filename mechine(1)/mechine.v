module mechine(CLK,startSet,num,start,clear,enter,money,restime);
   input CLK,startSet,start,clear,enter;
	input [4:0] num;
	output reg [7:0] money;
	output reg [7:0] restime;
	
	parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
	parameter second = 1;
	parameter pause = 20;
	
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
	reset = 0; //重设时钟
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

/*module mechine(CLK,startSet,num,start,clear,enter,money,restime);
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
	assign set = ((last_set != startSet) && startSet);
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
		   if (set && start)
			//if (set)
			begin
			   //state <= state;
				//if (start)
				//begin
				state <= S1;
				//end
			end
			else 
				 state <= S0;
		end
		S1:
		begin
		   if (money == 8'hff && restime == 8'hff)
			   state <= S0;
			else if (set && enter)
				//begin
					//state <= state;
				   //if (enter)
				state <= S2;
			else
				state <= S1;
				//end
			if (timer && (!reset) && ((pause_count > pause) || (pause_count == pause)))
			//begin
			   state <= S0;
			//end
			//end
		end
		S2:
		begin
			if (money == 0)
			   state <= S1;
		end
		endcase
//		last_set <= startSet;
	end
	
	always @ (state)
	begin
		case(state)
		S0:
		begin
			if (set && start)
//			begin
//			   if (start)
				begin
					money <= 0;
					restime <= 0;
					timer <= 1;
				end
//			end
			else
			begin
				money <= 8'hff;
				restime <= 8'hff;
			end
		end
		S1:
		begin
		  // if (money != 8'hff || restime != 8'hff)
			//begin
			   if (set && !enter)
				//begin
				   //if (!enter)
					begin
						if (clear)
						begin
						   //if (clear)
							//begin
							   money <= 0;
								restime <= 0;
								reset = 1;
								timer <= 1;
								pause_count <= 0;
							end
						else if(start && (money == 8'hff && restime == 8'hff))
							//begin
							   //if (money == 8'hff && restime == 8'hff)
								begin
								   money <= 0;
									restime <= 0;
									reset = 1;
									timer <= 1;
									pause_count <= 0;
								end
							//end
							//reset = 1;
							//timer <= 1;
							//pause_count <= 0;
						//end
						else if (set && num < 10)
						begin
						   timer <= 0;
							pause_count <= 0;
							next_money = (money * 10 + num) % 100;
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
				//end
				if (timer && (!reset))
				begin
				   if (pause_count < pause)
					   pause_count <= pause_count + 1;
					else
					begin
					   pause_count <= pause + 1;
						timer <= 0;
						pause_count <= 0;
					end
				end
			//end
		end
		S2:
		begin
			if (restime == 0)
				money <= 0;
			else if (time_count < second)
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
			//end
			if (money == 0)
			begin
				timer <= 1;
				pause_count <= 0;
			end
		end
		endcase
		last_set <= startSet;
	end
	
/*	always @ (posedge CLK)
	begin
	   case (state)
		S0:
		begin
		if (money == 8'hff)
		state <= S1;
		S1:state <= S2;
		S2:state <= S0;
		endcase
	end
	
	always @ (state)
	begin
		case(state)
		S0:money = 0;
	
		S1:money =1;
		
		S2:money =3;
		endcase
		
	end*/
	
/*	always @ (posedge CLK)
	begin
	reset = 0; //重设时钟
	   case (state)
		S0:
		begin
		   if (set)
			begin
			   state <= state;
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
				state <= state;
				   if (enter)
					   state <= S2;
					else
					begin
					   state <= S1;
						if (clear || start)
						begin
							state <= state;
						   if (clear)
							begin
								state <= state;
							   money <= 0;
								restime <= 0;
							end
							else
							begin
								state <= state;
							   if (money == 8'hff && restime == 8'hff)
								begin
									state <= state;
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
							state <= state;
						   timer <= 0;
							pause_count <= 0;
							next_money = (money * 10 + num) % 100;
							if (next_money > 20)
							begin
								state <= state;
							   money <= 20;
								restime <= 40;
							end
							else
							begin
								state <= state;
								money <= next_money;
								restime <= next_money * 2;
							end
						end
					end
				end
				if (timer && (!reset))
				begin
					state <= state;
				   if (pause_count < pause)
					begin
						state <= state;
					   pause_count <= pause_count + 1;
					end
					else
					begin
						state <= state;
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
			begin
				state <= state;
				money <= 0;
			end
			else
			begin
				state <= state;
				if (time_count < second)
				begin
					state <= state;
					time_count <= time_count + 1;
				end
				else
				begin
					state <= state;
					time_count <= 0;
				end
				if (time_count == second - 1)
				begin
				state <= state;
					if (restime != 0)
					begin
						state <= state;
						restime <= restime - 1;
					end
					if (restime == 1)
					begin
						state <= state;
						money <= 0;
					end
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
endmodule		*/