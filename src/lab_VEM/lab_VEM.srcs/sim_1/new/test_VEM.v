`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/05 16:40:24
// Design Name: 
// Module Name: test_VEM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_VEM();
	reg clk, reset;
	reg [2:0]No;
	reg [3:0]money;
	wire DP,DoneLED;
	wire [7:0]AN;
	wire [6:0]A2G;

	VEM test(clk, reset, No, money, DP, DoneLED, AN, A2G);

	initial begin
		clk = 0;
		reset = 0;
		
		No = 3'b111;
		money = 4'b0001;
		
		#750 No = 3'b100;
		
		money = 4'b0010;
		
		#150 money = 0;
		
		#650 No = 3'b010;
		
		#800 money = 4'b0101;
		
		#700 money = 4'b0001;
		
		#150 money = 0;
		
		#650 reset = 1;
	end

	always #50 clk = ~clk;
	
	always begin
		#4750 $finish;
	end
endmodule
