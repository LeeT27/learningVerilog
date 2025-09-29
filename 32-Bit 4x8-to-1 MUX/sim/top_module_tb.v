module top_module_tb;
    reg [31:0] in;
    reg [4:0] sel;  
    wire out;       

    top_module uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");  // Name of VCD file
        $dumpvars(0, top_module_tb);  // Dump all signals in this module

        in = 8; sel = 3; #10; $display("Input: %b\nSelected bit: %d\nBit value: %b",in,sel,out);
        in = 800; sel = 1; #10; $display("Input: %b\nSelected bit: %d\nBit value: %b",in,sel,out);
        in = 2051; sel = 9; #10; $display("Input: %b\nSelected bit: %d\nBit value: %b",in,sel,out);
        in = 8478341; sel = 12; #10; $display("Input: %b\nSelected bit: %d\nBit value: %b",in,sel,out);
        in = 412897143; sel = 15; #10; $display("Input: %b\nSelected bit: %d\nBit value: %b",in,sel,out);

        $finish;
    end

endmodule
