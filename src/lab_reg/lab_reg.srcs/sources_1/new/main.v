`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/02 16:30:14
// Design Name: 
// Module Name: main
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


module main(
    input reset, we, clk,
    input [1:0]op,
    input [4:0]n1, n2,
    output DP,
    output [3:0] AN,
    output  [6:0] A2G
    );
 
	wire [7:0]q1, q2;
    wire [7:0] di;
    
    regFile regfile(reset, we, clk, n1, n2, di, q1, q2);
    ALU alu(op, q1, q2, di);    
    display displayt(clk, q1, q2, DP, AN, A2G);
endmodule
