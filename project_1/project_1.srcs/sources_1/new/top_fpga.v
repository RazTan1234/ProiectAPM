`timescale 1ns / 1ps

module top_fpga(
    input  clk,            // ceas 100 MHz
    input  reset,          // CPU_RESETN (activ pe 0)
    output [7:0] An,
    output [6:0] Seg,
    output DP,
    output [5:0] LED       // acc in binar, pentru debugging
);
    wire clk_out_led, clk_out_seg;
    divizor_ceas divclk (
        .clk_in     (clk),
        .reset      (reset),
        .clk_out_led(clk_out_led),
        .clk_out_seg(clk_out_seg)
    );

    wire [5:0] acc;
    CPU cpu_inst (
        .clk  (clk_out_led),
        .reset(~reset),
        .acc  (acc)
    );
    assign LED = acc;

    wire [3:0] BCD0, BCD1;
    bin2bcd conv (
        .valoare_bin(acc),
        .BCD0(BCD0),
        .BCD1(BCD1)
    );

    afisare_7seg display (
        .clk_out_seg(clk_out_seg),
        .reset(reset),
        .BCD0(BCD0), .BCD1(BCD1), .BCD2(4'd0), .BCD3(4'd0),
        .An(An),
        .Seg(Seg),
        .DP(DP)
    );
endmodule