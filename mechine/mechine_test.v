`timescale 10ns / 1ns

module mechine_test;
	reg CLK,startSet,start,clear,enter;
	reg [4:0] num;
	wire [7:0] money;
	wire [7:0] restime;
	mechine mech(CLK,startSet,num,start,clear,enter,money,restime);

	always #2//generate the CLK signal
	begin
		CLK = ~CLK;
	end
	
	task press;
		input [4:0] _DATA;
		begin
		start = (_DATA == 11);
		clear = (_DATA == 12);
		enter = (_DATA == 13);
		if (_DATA == 10)
		   num = 0;
		else if (_DATA < 10)
		   num = _DATA;
		startSet = 1;
		#20 startSet = 0;
		#40;
		$display("Press %d key", _DATA); 
		$display("money %d",money);
		$display("time %d",restime);
		end
	endtask
	initial
	begin
		CLK = 0;
		startSet = 0;
		num = 5'b0;
		start = 0;
		clear = 0;
		enter = 0;
		#100;
		press(5'd3);//press '3'
		#100;
		press(5'd11);//START
		press(5'd1);//press '1'
		press(5'd5);//press '5'
//		$display("money %d",money);
//		$display("time %d",restime);
		press(5'd13);//CONFIRM
		#200;
		press(5'd2);//press '2'
		press(5'd4);//press '4
//		$display("money %d",money);
//		$display("time %d",restime);
		press(5'd12);//press RST
		#100;
		press(5'd11);//START
		press(5'd4);//press '4'
		press(5'd3);//press '3'
//		$display("money %d",money);
//		$display("time %d",restime);
		press(5'd6);//press '6', now should be 36, but according to the limitation, the maximum money is 20
//		$display("money %d",money);
//		$display("time %d",restime);
		press(5'd13);//CONFIRM
		#20 press(5'd3);//any other key, nothing happen
		#100;
		press(5'd11);//START
		press(5'd1);//press '1'
		press(5'd13);//CONFIRM
		#100;
		press(5'd11);//START
		press(5'd2);//press '2'
		press(5'd13);//CONFIRM
		#100;
		press(5'd11);//START
		press(5'd3);//press '3'
		press(5'd13);//CONFIRM
		#100;
		press(5'd11);//START
		press(5'd4);//press '4'
		press(5'd13);//CONFIRM
		#100;
		press(5'd11);//START
		press(5'd5);//press '5'
		press(5'd13);//CONFIRM
		#80;
		press(5'd12);//CLEAR
		press(5'd11);//START
		press(5'd6);//press '6'
		press(5'd13);//CONFIRM
	end
endmodule