`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/03 11:14:02
// Design Name: 
// Module Name: PCPlus4
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


module PCPlus4(a, b, result);
  input [31:0] a, b;
  output [31:0] result;
  
  assign result = a + b;
 
endmodule
