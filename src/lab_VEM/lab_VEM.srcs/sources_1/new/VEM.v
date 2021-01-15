`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/04 12:29:54
// Design Name: 
// Module Name: VEM
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


module VEM(
	input clk, reset,
	input [2:0]No,
	input [3:0]money,
	output DP,DoneLED,
	output [7:0]AN,
	output [6:0]A2G
    );
    
    wire [5:0]money_paid;
    wire hasDone;
    
    paid calPaid(clk, hasDone, reset, 
    No,
    money, money_paid);
    display display(clk, hasDone, No, 
    	money_paid, DoneLED, DP, AN, A2G);
    compDone compDone(No, money, money_paid, hasDone);
endmodule
