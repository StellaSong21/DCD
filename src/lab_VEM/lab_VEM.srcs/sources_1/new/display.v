`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/04 09:05:53
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
	input clk,hasDone,
	input [2:0]No, // 0001-0110
	input [5:0]Paid, // 0000.0-1101.0
	output reg DoneLED, DP,
	output reg [7:0]AN,
	output reg [6:0]A2G
    );
    
    reg [19:0]clkdiv;
    reg [3:0]digit;
    
    wire [2:0]s;
 
   initial begin
   		clkdiv = 0;
   end
//`ifdef DEBUG
	assign s = clkdiv[2:0];
//`else
//	assign s = clkdiv[19:17];
//`endif

    always @(posedge clk) begin
    	clkdiv = clkdiv+1;
    end
 
 	always @(hasDone) begin
 		DoneLED = hasDone;
 	end
 
    always @(*) begin
    	case(s)
    	    3'b000: digit = Paid[0:0] * 5; 
    		3'b001: digit = Paid[4:1];
    		3'b010: digit = Paid[5:5];
    		3'b100: begin if(No <= 6) digit = No; else digit = 0; end
    	    default: digit = 0;
   		endcase
   		if(s == 3'b001)
   			DP = 0;
   		else
   			DP = 1;
    end
    
    always @(*) begin
    	AN = 8'b11111111;
    	AN[s] = 0;
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
