module top_module(
    input [7:0] a,
    input [7:0] b,
    output [8:0] y
);
    wire [8:0] cin;
    assign cin[0] = 1'b0;
    
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : loop
            full_adder fa(.a(a[i]), .b(b[i]), .cin(cin[i]), .s(y[i]), .cout(cin[i+1]));
        end
    endgenerate
    assign y[8] = cin[8];

endmodule
