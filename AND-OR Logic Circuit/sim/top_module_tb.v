module top_module_tb;
    reg a;
    reg b;  
    reg c;
    wire y;       

    top_module uut (
        .a(a),
        .b(b),
        .c(c),
        .y(y)
    );

    initial begin
        $dumpfile("wave.vcd");  // Name of VCD file
        $dumpvars(0, top_module_tb);  // Dump all signals in this module

        a = 0; b = 0; c = 0; #10;
        a = 1; b = 0; c = 0; #10;
        a = 0; b = 1; c = 0; #10;
        a = 0; b = 0; c = 1; #10;
        a = 1; b = 1; c = 0; #10;
        a = 0; b = 1; c = 1; #10;
        a = 1; b = 0; c = 1; #10;
        a = 1; b = 1; c = 1; #10;

        $finish;
    end

endmodule
