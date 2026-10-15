module ALU(
    input wire OP, //operatia: adunare/scadere
    input wire [5:0] A, B, //operanzii
    output wire [5:0] S //rezultatul
);
//TODO:
    assign S = OP ? (A - B) : (A + B);
endmodule