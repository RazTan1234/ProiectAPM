`timescale 1ns / 1ps

module cpu_testbench();

    reg clk, reset;
    wire [5:0] acc;

    CPU cpu_uut(clk, reset, acc);

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        reset = 1'b1;
        #10 reset = 1'b0;
        #200 $finish();
    end

endmodule