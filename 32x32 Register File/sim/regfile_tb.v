module regfile_tb;
    reg clk;
    reg reg_write;
    reg [4:0] write_address, read1_address, read2_address;
    reg [31:0] write;
    wire [31:0] read1, read2;

    regfile uut (
        .clk(clk),
        .reg_write(reg_write),
        .write_address(write_address),
        .read1_address(read1_address),
        .read2_address(read2_address),
        .write(write),
        .read1(read1),
        .read2(read2)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");  // Name of VCD file
        $dumpvars(0, regfile_tb);  // Dump all signals in this module

        reg_write = 0;
        write_address = 0;
        read1_address = 0;
        read2_address = 0;
        write = 0;


        #10;
        reg_write = 1; write_address = 4; write = 32'd67;
        #10;
        reg_write = 0; write = 0;
        read1_address = 4; read2_address = 0;
        #10;
        reg_write = 1; write_address = 12; write = 32'd42;
        #10;
        reg_write = 0; read1_address = 12; read2_address = 5;
        #10;

        $finish;
    end


endmodule
