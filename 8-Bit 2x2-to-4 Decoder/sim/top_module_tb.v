module top_module_tb;
    reg [2:0] in;
    wire [7:0] out;       

    top_module uut (
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");  // Name of VCD file
        $dumpvars(0, top_module_tb);  // Dump all signals in this module

        in = 0; #10; $display("Input: %b       Output: %b",in,out);
        in = 1; #10; $display("Input: %b       Output: %b",in,out);
        in = 2; #10; $display("Input: %b       Output: %b",in,out);
        in = 3; #10; $display("Input: %b       Output: %b",in,out);
        in = 4; #10; $display("Input: %b       Output: %b",in,out);
        in = 5; #10; $display("Input: %b       Output: %b",in,out);
        in = 6; #10; $display("Input: %b       Output: %b",in,out);
        in = 7; #10; $display("Input: %b       Output: %b",in,out);

        $finish;
    end

endmodule
