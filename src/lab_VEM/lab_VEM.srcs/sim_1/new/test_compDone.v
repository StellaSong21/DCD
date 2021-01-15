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


module test_compDone();
	reg [2:0]No;
	reg [3:0]money;
	reg [5:0]Paid;
	wire hasDone;
	
	compDone test(No, money, Paid, hasDone);
	
	initial begin
		No = 3'b100;
		money = 4'b0000;
		Paid = 6'b000000;
		
		#50 Paid = 6'b000001;
		
		#50 Paid = 6'b000100;
		
		#50 Paid = 6'b000000;
		money = 4'b0001;
		
		#50 money = 4'b0000;
		Paid = 6'b000101;
	end
	
	always begin
		#250 $finish;
	end
	
endmodule
