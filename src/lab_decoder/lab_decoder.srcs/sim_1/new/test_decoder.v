`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/26 22:57:23
// Design Name: 
// Module Name: test_decoder
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


module test_decoder();
    reg [2:0]in;
    wire [7:0]out;
    decoder test(in, out);
    initial begin
        in = 3'b000;
        #50 in = 3'b010;
        #50 in = 3'b111;
     end 
    initial begin
        $monitor($time,,, "%b = %b", in, out);
        #150
        $finish;
    end


endmodule
