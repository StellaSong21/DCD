`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/25 15:34:47
// Design Name: 
// Module Name: decoder
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


module decoder(
    input[2:0] in,
    output reg[7:0] out
    );
    
    integer i;
    always @(in) begin
        for (i = 0; i < 8; i = i+1) begin
            if (in == i) 
                out[i] <= 1;
            else
                out[i] <= 0;
        end
    end
endmodule
