`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Software Engineering, Fudan University
// Engineer: Yijing Song
// 
// Create Date: 2019/10/15 00:19:23
// Design Name: ALU
// Module Name: ALU
// Project Name: LAB01:  ALU arithmetic unit
// Target Devices: ARTIX-7 XC7A100T
// Tool Versions: Vivado 2015.5.4
// Description: Half adder, half subtracter, inverse operation and multiplication,  
//                 all for 4-bit binary number, were realized in this lab.
// 
// Dependencies: null
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: DDL..2019/10/16 23:59:59
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
    input [1:0]op,
    input [3:0]a, b,
    output  [3:0]out,
    output Cout
    );

    reg [3:0] outtmp;
    reg [3:0] couttmp;

    initial begin
        couttmp = 0;
    end

    always @(op, a, b) begin
        case(op)
            2'b0: {couttmp, outtmp} = a + b;
            2'b01: {couttmp, outtmp} = a - b;
            2'b10: outtmp = ~a;
            default: {couttmp, outtmp} = a * b;
        endcase
    end
    
    assign out = outtmp;
    assign Cout = (couttmp>0);
    
endmodule
