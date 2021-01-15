`timescale 1ns / 1ps

//`include "ALU.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/15 07:12:23
// Design Name: 
// Module Name: test_ALU
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


module test_ALU();
    reg [1:0]op;
    reg [3:0]a, b;
    wire [3:0]out;
    wire Cout;
    ALU test(op, a, b, out, Cout);
    initial begin
        op = 2'b0;
        a = 4'b0;
        b = 4'b0;
    end
    initial begin
            a = 4'b1000; b = 4'b1111; op = 0;
            #50  a = 4'b0101; b = 4'b1010; op = 1;
            #50  a = 4'b1010; b = 1; op = 2;
            #50  a = 4'b1111; b = 4'b0010; op = 3;
     end 
    initial begin
        $monitor($time,,, "{%b %b %b} = {%b, %b}", a, op, b, out, Cout);
        #200
        $finish;
    end
endmodule

