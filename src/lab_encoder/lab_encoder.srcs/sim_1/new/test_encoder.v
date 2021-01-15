`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/26 22:27:47
// Design Name: 
// Module Name: test_encoder
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


module test_encoder();
    reg [3:0]in;
    wire [2:0]out;
    encoder test(in, out);
    initial begin
        in = 4'b0000;
    end
    initial begin
           #50 in = 4'b1100;
           #50 in = 4'b0010;
     end 
    initial begin
        $monitor($time,,, "%b = %b", in, out);
        #150
        $finish;
    end
endmodule
