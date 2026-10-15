`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 02:53:34 PM
// Design Name: 
// Module Name: PC
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


module PC(
    input wire clk,
    input wire reset,
    input wire enable,
    output reg [7:0] pointer //adresa instructiunii curente
);



    always @(posedge clk or posedge reset) begin
        if (reset)
            pointer <= 8'h00;
        else if (enable)
            pointer <= pointer + 1'b1;
    end

endmodule
