module ram_tb #(
    parameter BITS_PER_WORD = 32,
    parameter ADDRESS_BITS = 7
);
    reg clk;
    reg write_RAM;
    reg reset;
    reg [ADDRESS_BITS-1:0] address;
    reg [BITS_PER_WORD-1:0] in;
    wire [BITS_PER_WORD-1:0] out;

    ram uut (
        .clk(clk),
        .write_RAM(write_RAM),
        .reset(reset),
        .address(address),
        .in(in),
        .out(out)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");  // Name of VCD file
        $dumpvars(0, ram_tb);  // Dump all signals in this module

        write_RAM = 0; address = 0; in = 0; reset = 0;
        #10;
        write_RAM = 1; address = 4; in = 32'd44;
        #10;
        write_RAM = 0; address = 4; in = 0;
        #10; 
        write_RAM = 1; address = 2; in = 32'd7;
        #10;
        write_RAM = 0; address = 2; in = 0;
        #10;
        reset = 1;
        #10;
        reset = 0; address = 2; in = 0;
        #10;

        $finish;
    end


endmodule
