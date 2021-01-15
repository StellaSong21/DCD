`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/05 20:59:27
// Design Name: 
// Module Name: test_regFile
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


module test_regFile();
	reg reset, WE, clk;
   	reg [4:0]n1,n2;
   	reg [7:0]DI;
  	wire [7:0]q1,q2;
 	regFile regfile(reset, WE, clk, n1, n2, DI, q1, q2);
 	initial begin
 		clk = 0;
 		WE = 0;
 		reset = 0;
 		
 		n1 = 4'b0001;
 		n2 = 4'b0010;
 		DI = 8'b00000010;
 		
 		#100 WE = 1;
 		#150 WE = 0;
 		#100 reset = 1;
 	end
 	always #50 clk = ~clk;
endmodule
