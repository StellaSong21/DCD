`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Fudan Unversity
// Engineer: Song
// 
// Create Date: 2019/11/02 14:38:50
// Design Name: lab_reg
// Module Name: regFile
// Project Name: lab_reg
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

module regFile(
    input reset, WE, clk,
    input [4:0]n1,n2,
    input [7:0]DI,
    output reg [7:0]q1,q2
    );
    
    reg [7:0] data[0:31];
    reg clk2 = 0;
    integer count = 0;
    integer i;

	initial begin
		for(i = 0; i < 32; i = i + 1) begin
			data[i] = 1; 
		end
	end

	always @(posedge clk) begin
		count = count + 1;
			if(count > 200000000) begin 
				clk2 = ~clk2; 
				count = 0;
			end
//		clk2 = ~clk2;
	end

    always @(posedge clk2) begin
			q1 = data[n1];
			q2 = data[n2];
	end

	always @(negedge clk2) begin
		if(WE) begin 
				if(reset)
					data[n1] = 1;
				else
					data[n1] = DI;
			end
		if(reset) begin
			for(i = 0; i < 32; i = i + 1) begin
				data[i] = 1; 
			end
		end
	end  

endmodule       
