module PC(
    input clk,
    input reset,
    input jump,
    input [6:0] jump_address,
    output reg [6:0] pc
);

always @(posedge clk or posedge reset) begin
    if (reset)
        pc <= 0;
    else if (jump)
        pc <= jump_address;
    else
        pc <= pc + 1;
end

endmodule