`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Fudan University
// Engineer: Song
// 
// Create Date: 2019/11/04 09:39:21
// Design Name: paid
// Module Name: paid
// Project Name: lab_VEM
// Target Devices: Artix-7
// Tool Versions: Vivado 2015.4
// Description: it calculates and stores how much has been paid.
// 
// Dependencies: null
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 233333
// 
//////////////////////////////////////////////////////////////////////////////////


module paid(
	input clk, hasDone, reset,
	input [2:0]No,
	input [3:0]money,
	output reg [5:0]paid
    );
    
    reg clk2;
    integer count = 0;
    reg [3:0]money_cur;
    
    initial begin
    	paid = 0;
    	clk2 = 0;
    end
    
    always @(posedge clk) begin
    
//`ifdef DEBUG
	clk2 = ~clk2;
//`else
//    	count = count + 1;
//    	if(count > 8000000) begin
//    		clk2 = ~clk2;
//    		count = 0;
//    	end
//`endif

    end
    
    always @(posedge clk2 or posedge reset) begin
    	if(reset)
    		paid = 0;
    	else begin	
    	case(money)
    		4'b0001: money_cur = 4'b0001;
    		4'b0010: money_cur = 4'b0010;
    		4'b0100: money_cur = 4'b0100;
    		4'b1000: money_cur = 4'b1010;
    		default: money_cur = 0;
    	endcase
		// BUG: important!!! && !money_cur 
    	if(hasDone && money_cur)
    		paid = 0;
    	if(No >= 1 && No <= 6)
    	paid = paid + money_cur;
    	end
    end
    
endmodule
