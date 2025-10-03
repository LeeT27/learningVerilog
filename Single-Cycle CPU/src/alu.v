module alu (
    input [31:0] a, b,
    input [2:0] alu_op,
    output reg [31:0] alu_result,
    output zero
);

    localparam alu_add  = 3'b000;
    localparam alu_sub  = 3'b001;
    localparam alu_mult  = 3'b010;
    localparam alu_div = 3'b011;
    localparam alu_xor  = 3'b100;
    localparam alu_slt  = 3'b101;

    always @(*) begin
        case(alu_op)
            alu_add: alu_result = a + b;
            alu_sub: alu_result = a - b;
            alu_mult: alu_result = a * b;
            alu_div:  alu_result = (b != 0) ? a / b : 32'b0;
            alu_xor: alu_result = a ^ b;
            alu_slt: alu_result = $signed(a) < $signed(b) ? 32'b1 : 32'b0;
            default: alu_result = 32'b0;
        endcase
    end

    assign zero = (alu_result == 32'b0);

endmodule