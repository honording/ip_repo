module ov7670_invert(
	pinin,
	pinout);
	input pinin;
	output pinout;

	assign pinout = !pinin;
	
endmodule