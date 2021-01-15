`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Fudan University
// Engineer: 
// 
// Create Date: 2019/10/25 16:00:07
// Design Name: 4-2 Encoder
// Module Name: encoder
// Project Name: lab2_encoder
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


module encoder(
    input[3:0] in,
    output [2:0] out
    );
    
    reg [2:0]tempout;
    integer i;
    always @(in) begin
        casex(in)
            4'b1000: tempout = 3'b100;
            4'bx100: tempout = 3'b101;
            4'bxx10: tempout = 3'b110;
            4'bxxx1: tempout = 3'b111;
            default: tempout = 3'b000;
        endcase
    end
    
    assign out = tempout;
    
endmodule
