`timescale 1ns / 1ps

module clock_divider(
    input wire clk_100mhz,  // Ceasul pl?cii (100 MHz)
    input wire reset,
    output reg clk_1hz      // Ceasul redus la 1 Hz
);
    // Pentru Nexys 7 (100MHz), jum?tate de secund? înseamn? 50.000.000 cicluri
    // Dac? vrei simulare rapid?, po?i mic?ora aceast? valoare, dar pe plac? e 50.000.000
    reg [26:0] counter = 27'd0;
    parameter LIMIT = 27'd50000000; 

    always @(posedge clk_100mhz or posedge reset) begin
        if (reset) begin
            counter <= 27'd0;
            clk_1hz <= 1'b0;
        end else if (counter >= LIMIT - 1) begin
            counter <= 27'd0;
            clk_1hz <= ~clk_1hz;
        end else begin
            counter <= counter + 1'b1;
        end
    end
endmodule