module DECODER(
    input  wire [7:0] instr, //instructiunea curenta
    output wire OP, //semnalul de operatie pt ALU incazul instructiunilor ADD/SUB
    output wire LOAD_ACC, //semnalul de selectie pentru MUX in cazul unei instructiuni LOAD
    output wire OUT_ACC, //semnalul marcare a unei instructiuni OUT ce va dezactiva accumulatorul
    output wire [5:0] A, //data incarcata in accumulator
    output wire [5:0] B, //data adunata/scazuta la/din acumulator
    output wire HALT //semnalul de oprire a procesorului ce dezactiveaza registrul PC
);
//TODO:

    assign OP = instr[7];
    assign LOAD_ACC = (instr[7:6] == 2'b00);
    assign OUT_ACC = (instr[7:6] == 2'b11);
    assign A = instr[5:0];
    assign B = instr[5:0];
    assign HALT = (instr == 8'b11111111);

endmodule