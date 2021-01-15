`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/05 19:38:18
// Design Name: 
// Module Name: test_ALU
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


module test_ALU();
	reg [1:0]op;
    reg [7:0]q1, q2;
    wire [7:0]out;
    ALU test(op, q1, q2, out);
    initial begin
    	op = 2'b00;
    	q1 = 8'b10000000;
    	q2 = 8'b01111111;
    	
    	#100 op = 2'b01;
    	
    	#100 op = 2'b10;
    	
    	#100 op = 2'b11;
    end
    always begin
    	#400 $finish;
    end
endmodule
