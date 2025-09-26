module top_module(
    input [2:0] in,
    output [7:0] out
);
    wire [3:0] decoder_low, decoder_high;
    decoder_2x4 f1(.in(in[1:0]), .EN(~in[2]), .out(decoder_low));
    decoder_2x4 f2(.in(in[1:0]), .EN(in[2]), .out(decoder_high));

    assign out = {decoder_high, decoder_low};
        
endmodule