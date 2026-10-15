module MEMORY(
    input wire [7:0] address,
    output reg [7:0] instr
);

    reg [7:0] mem [0:255];

    integer i;
    initial begin
        for (i=0; i<=255; i=i+1)
            mem[i] = 8'h00;

        mem[0]  = 8'b00000001; // LOAD 1
        mem[1]  = 8'b01000010; // ADD 2
        mem[2]  = 8'b01000011; // ADD 3
        mem[3]  = 8'b10000100; // SUB 4
        mem[4]  = 8'b01001110; // ADD 14
        mem[5]  = 8'b10000110; // SUB 6
        mem[6]  = 8'b11000000; // OUT
        mem[7]  = 8'b00000000; // LOAD 0
        mem[8]  = 8'b01111111; // ADD 63
        mem[9]  = 8'b10100000; // SUB 32
        mem[10] = 8'b11000000; // OUT
        mem[11] = 8'b11111111; // HALT
    end

    always@(*) begin
        instr = mem[address];
    end

endmodule