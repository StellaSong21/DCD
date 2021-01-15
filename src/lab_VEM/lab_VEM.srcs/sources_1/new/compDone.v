`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/04 12:10:16
// Design Name: 
// Module Name: compDone
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


module compDone(
	input [2:0]No, // 0001-0110
	input [3:0]money,
	input [5:0]Paid, // 0000.0-1101.0
	output reg hasDone
    );
    
    reg [4:0] price;
    
    // +
    reg [3:0]money_cur;
    always @(money) begin
    	case(money)
        	4'b0001: money_cur = 4'b0001;
        	4'b0010: money_cur = 4'b0010;
        	4'b0100: money_cur = 4'b0100;
        	4'b1000: money_cur = 4'b1010;
        	default: money_cur = 0;
        endcase
    end
        
    always @(No) begin
    	case(No)
    		3'b001: price = 5'b00001;
    		3'b010: price = 5'b00010;
    		3'b011: price = 5'b00011;
    		3'b100: price = 5'b00100;
    		3'b101: price = 5'b01101;
    		3'b110: price = 5'b11010;
    		default: price = 5'b11111;
    	endcase
    end
    
    always @(*) begin
    	if(hasDone == 1 || hasDone == 0) begin  end
		else
			hasDone = 0;    
    	if(hasDone && money_cur)
        	hasDone = ~hasDone;
    	if(Paid >= price && (No >= 1 || No <= 6))
    		hasDone = 1;
    end
  
endmodule
