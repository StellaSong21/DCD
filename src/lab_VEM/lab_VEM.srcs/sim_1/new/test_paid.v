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

//`define DEBUG 1

module test_paid();
	reg clk, hasDone, reset;
	reg [2:0]No;
	reg [3:0]money;
	wire [4:0]paid;
	
	paid test(clk, hasDone, reset, No, money, paid);
	
	initial begin
		clk = 1;
		reset = 0;
		hasDone = 0;
		
		// 1. No is invalid, paid += 0;
		No = 3'b111;
		money = 4'b0001;
		// paid = 0;
		
		// 2. No is valid
		#150 No = 3'b100; //150
		// paid = 5'b00001;
		#100 money = 0; //250
		
		// 3. change No from 4 to 2
		No = 3'b010; //250
		// paid = 5'b00001;
		
		// 4. paid is enough 
		#100  money = 4'b0001; //350
		#100 hasDone = 1; //450
		// paid = 5'b00010;
		
		// 5. paid unchange without new money in
		money = 4'b1001; //450
		// paid = 5'b00010;
		
		// 6. paid clear when new money in (a new trade)
		#100 money = 4'b0001; //550 
		#100 hasDone = 0; money = 0; // 650
		// paid = 5'b00001;
		
		// 7. reset
		#100 reset = 1; // 750
		// paid = 0;
		
	end
	
	always #50 clk = ~clk;
	
	always begin
		#900 $finish;
	end
endmodule
