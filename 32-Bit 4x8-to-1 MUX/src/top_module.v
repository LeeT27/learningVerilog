module top_module(
    input [31:0] in,
    input [4:0] sel,
    output out
);
    wire [3:0] MUX_results;

    MUX_8x1 f1(.in(in[7:0]), .sel(sel[2:0]), .out(MUX_results[0]));
    MUX_8x1 f2(.in(in[15:8]), .sel(sel[2:0]), .out(MUX_results[1]));
    MUX_8x1 f3(.in(in[23:16]), .sel(sel[2:0]), .out(MUX_results[2]));
    MUX_8x1 f4(.in(in[31:24]), .sel(sel[2:0]), .out(MUX_results[3]));

    assign out = sel[4:3] == 2'b00 ? MUX_results[0] :
        sel[4:3] == 2'b01 ? MUX_results[1] :
        sel[4:3] == 2'b10 ? MUX_results[2] :
        MUX_results[3] ;

endmodule