`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/02 17:00:39
// Design Name: 
// Module Name: display
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


module display(
    input clk,  
    input [7:0]Q1, Q2,
    output DP,
    output reg [3:0] AN,
    output reg [6:0] A2G
    );
    
    wire [1:0]s;
    reg [3:0]digit;
    reg [19:0]clkdiv = 0;
    
    assign s = clkdiv[19:18];
//	assign s = clkdiv[1:0];
    assign DP = 1;
    
    always @(s) begin
    	case(s)
    		1:digit = Q1[3:0];
    		2:digit = Q2[7:4];
    		3:digit = Q2[3:0];
    		default:digit = Q1[7:4];
    	endcase
    end
    
    always @(*) begin
    	AN = 4'b1111;
    	AN[s] = 0;
    end
    
    always @(posedge clk) begin
    		clkdiv = clkdiv + 1;
    end
   	    
     always @(*) begin
           case(digit)
               4'h1: A2G = 7'b1111001;
               4'h2: A2G = 7'b0100100;
               4'h3: A2G = 7'b0110000;
               4'h4: A2G = 7'b0011001;
               4'h5: A2G = 7'b0010010;
               4'h6: A2G = 7'b0000010;
               4'h7: A2G = 7'b1111000;
               4'h8: A2G = 7'b0000000;
               4'h9: A2G = 7'b0010000;
               4'hA: A2G = 7'b0001000;
               4'hB: A2G = 7'b0000011;
               4'hC: A2G = 7'b1000110;
               4'hD: A2G = 7'b0100001;
               4'hE: A2G = 7'b0000110;
               4'hF: A2G = 7'b0001110;
               default: A2G = 7'b1000000;
           endcase
       end
endmodule
