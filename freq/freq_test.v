`timescale 10ns / 1ns

module freq_test;
	reg CLK;
	wire OCLK;
	parameter Tburst = 100000000, Ton = 1, Toff = 1;
	
	freq f(CLK, OCLK);
	initial
	begin
		CLK = 0;
		repeat (Tburst)
			begin
				#Toff CLK = 1'b0;
				#Ton  CLK = 1'b1;
			end
	end

endmodule