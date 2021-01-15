`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/02 19:49:16
// Design Name: 
// Module Name: test_reg
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


module test_reg(
    );
    reg [1:0] op;
    reg we, reset, clk;
    reg [4:0]n1, n2;
    wire  DP;
    wire  [3:0] AN;
    wire  [6:0] A2G;
    
    main entrance(reset, we, clk, op, n1, n2, DP, AN, A2G);
    
    initial begin
        reset = 1;
        clk = 0;  
        we = 0;
        #10 reset = 0;
        
        op = 0; n1 = 1; n2 = 1;
		#15 we = 1; 
		#15 we = 0;
		
		#35 op = 0; n1 = 2;
		#10 we = 1;
		#15 we = 0;
		
		#55 op = 1; n1 =1; n2 = 1;
		#10 we = 1;
		#15 we = 0;
		
		#55 op = 1; n1 = 2; n2 =1;
		#10 we = 1;
		#15 we = 0;
		
		#55 op = 3; n1 = 3; n2 =1;
		#10 we = 1;
		#15 we = 0;
		
		#55 op = 3; n1 = 4; n2 =2;
		#10 we = 1;
		#15 we = 0;
		
		#55 op = 2; n1 = 3; n2 = 2;
		#10 we = 1;
		#15 we = 0;
		
		#55 op = 2; n1 = 4; n2 = 2;
		#10 we = 1;
		#15 we = 0;
    end

    always #5 clk = ~clk;
    
    initial begin
    	#635 $finish;
    end
  
endmodule
