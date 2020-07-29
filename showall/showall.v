module showall(CLK,money,restime,dig,seg);
   input CLK;
	input [7:0] money;
	input [7:0] restime;
	output [3:0] dig;
	output [6:0] seg;
	wire [3:0] num;
	
	DigChoose dc(CLK,money,restime,dig,num);
	show sh(CLK,num,seg);
	
endmodule
