module top_module(
    input a,
    input b,
    input c,
    output y
);
    wire and_out;

    and_gate g1(
        .a(a),
        .b(b),
        .y(and_out)
    );

    or_gate g2(
        .a(and_out),
        .b(c),
        .y(y)
    );

endmodule