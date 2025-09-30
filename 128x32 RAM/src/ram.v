module ram #(
    parameter BITS_PER_WORD = 32,
    parameter ADDRESS_BITS = 7
)(
    input clk,
    input write_RAM,
    input reset,
    input [ADDRESS_BITS-1:0] address,
    input [BITS_PER_WORD-1:0] in,
    output reg [BITS_PER_WORD-1:0] out
);
    reg [BITS_PER_WORD-1:0] memory [(1<<ADDRESS_BITS)-1:0];
    integer i;

    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < (1<<ADDRESS_BITS); i++)
                memory[i] <= 0;
            out <= 0;
        end
        else begin
            if (write_RAM) begin
                memory[address] <= in;
            end
            out <= memory[address];
        end
    end

endmodule