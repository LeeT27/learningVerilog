module top_module(
    input [31:0] a, b,
    input [3:0] op,
    output [31:0] out,
    output zero
);
    alu f1(.a(a[7:0]), .b(b[7:0]), .op(op[2:0]), .out(out[7:0])), .zero(zero);
        
endmodule