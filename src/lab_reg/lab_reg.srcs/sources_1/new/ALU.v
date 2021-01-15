`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Fudan University
// Engineer: Song
// 
// Create Date: 2019/11/02 15:52:28
// Design Name: 
// Module Name: ALU
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

module ALU(
    input [1:0]op,
    input [7:0]q1, q2,
    output  reg [7:0]out
    );

    always @(*) begin
        case(op)
            2'b0: out = q1 + q2;
            2'b01: out = q1 - q2;
            2'b10: out = ~q1;
            default: out = q1 * q2;
        endcase
    end
 
endmodule
