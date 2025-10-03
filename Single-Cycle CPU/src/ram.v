module ram (
    input clk,
    input write_RAM,
    input read_RAM,
    input reset,
    input [6:0] RAM_address,
    input [31:0] write_data,
    input [6:0] pc,
    output reg [31:0] read_data,
    output reg [31:0] instruction
);
    reg [31:0] memory [127:0];
    integer i;

    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < 128; i = i + 1)
                memory[i] <= 0;
        end else begin
            if (write_RAM)
                memory[RAM_address] <= write_data;
        end
    end

    always @(*) begin
        instruction = memory[pc];
        if (read_RAM)
            read_data = memory[RAM_address];
        else
            read_data = 0;
    end

endmodule