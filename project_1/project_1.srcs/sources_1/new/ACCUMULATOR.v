`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 02:54:29 PM
// Design Name: 
// Module Name: ACCUMULATOR
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


module ACCUMULATOR(
    input wire clk, 
    input wire reset,
    input wire enable,
    input wire [5:0] data_in, //datele de intrare ce urmeaza a fi incarcate
    output reg [5:0] data_out //iesirea datelor curente salvate in registru
);
//TODO:
always @(posedge clk or posedge reset) begin
        if (reset)
            data_out <= 6'b000000;
        else if (enable)
            data_out <= data_in;
    end
endmodule
