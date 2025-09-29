module alu (
    input [31:0] a, b,
    input [2:0] op,
    output reg [31:0] out,
    output zero
);

    localparam alu_add  = 3'b000;
    localparam alu_sub  = 3'b001;
    localparam alu_and  = 3'b010;
    localparam alu_or = 3'b011;
    localparam alu_xor  = 3'b100;
    localparam alu_slt  = 3'b101;
    localparam alu_sll  = 3'b110;
    localparam alu_srl  = 3'b111;

    always @(*) begin
        case(op)
            alu_add: out = a + b;
            alu_sub: out = a - b;
            alu_and: out = a & b;
            alu_or: out = a | b;
            alu_xor: out = a ^ b;
            alu_slt: out = $signed(a) < $signed(b) ? 32'b1 : 32'b0;
            alu_sll: out = a << b[5:0];
            alu_srl: out = a >> b[5:0];
            default: out = 32'b0;
        endcase
    end

    assign zero = (32'b0 == out);

endmodule