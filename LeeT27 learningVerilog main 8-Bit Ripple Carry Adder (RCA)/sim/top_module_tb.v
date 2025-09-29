module top_module_tb;
    reg [7:0] a;
    reg [7:0] b;  
    wire [8:0] y;       

    top_module uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $dumpfile("wave.vcd");  // Name of VCD file
        $dumpvars(0, top_module_tb);  // Dump all signals in this module

        a = 1; b = 1; #10; $display("%d + %d = %d",a,b,y);
        a = 0; b = 0; #10; $display("%d + %d = %d",a,b,y);
        a = 5; b = 7; #10; $display("%d + %d = %d",a,b,y);
        a = 100; b = 95; #10; $display("%d + %d = %d",a,b,y);
        a = 75; b = 200; #10; $display("%d + %d = %d",a,b,y);
        a = 201; b = 196; #10; $display("%d + %d = %d",a,b,y);

        $finish;
    end

endmodule
