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

//`define DEBUG

module test_display();
	reg clk,hasDone;
	reg [2:0]No; // 0001-0110
	reg [5:0]Paid; // 0000.0-1101.0
	wire DoneLED, DP;
	wire [7:0]AN;
	wire [6:0]A2G;
	
	display test(clk,hasDone, No, Paid, DoneLED, DP, AN, A2G);
	
	initial begin
		clk = 0;
		No = 3'b111;
		Paid = 6'b000011;
		hasDone = 0;
		
		#700 No = 3'b110;
		Paid = 6'b101000;
		hasDone = 1;
	end
	
	always #50 clk = ~clk;
	
	always begin
		#1550 $finish;
	end
endmodule
