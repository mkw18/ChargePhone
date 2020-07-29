`timescale 10 ns / 1ns

module showall_test;
	reg [7:0] money,restime;
	reg CLK;
	wire [3:0] dig;
	wire [6:0] seg;
	showall sh(CLK,money,restime,dig,seg);
	always #2
		CLK = ~CLK;
	
	initial 
	begin
		CLK = 0;
		money = 8'hff;
		restime = 8'hff;
		#100;
		for (money = 0; money < 21; money = money + 1)
		begin
			restime = money << 1;
			#25;
		end
		money = 8'hff;
		restime = 8'hff;
	end
endmodule