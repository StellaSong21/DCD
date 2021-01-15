`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/05 20:45:15
// Design Name: 
// Module Name: test_display
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


module test_display();
	reg clk;  
    reg [7:0]Q1, Q2;
    wire DP;
    wire [3:0] AN;
    wire [6:0] A2G;
    
    display test(clk, Q1, Q2, DP, AN, A2G);
    
    initial begin
    	clk = 0;
    	Q1 = 8'b10010110;
    	Q2 = 8'b01011010;
    end
    
    always #50 clk = ~clk;
endmodule
