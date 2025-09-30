module regfile (
    input clk,
    input reg_write,
    input [4:0] write_address, read1_address, read2_address,
    input [31:0] write,
    output [31:0] read1, read2
);
    reg [31:0] register [31:0];

    assign read1 = register[read1_address];
    assign read2 = register[read2_address];

    always @(posedge clk) begin
        if ((reg_write) && (write_address != 0)) begin
            register[write_address] <= write;
        end
    end

endmodule