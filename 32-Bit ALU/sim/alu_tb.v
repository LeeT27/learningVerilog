module alu_tb;
    reg [31:0] a, b;
    reg [2:0] op;
    wire [31:0] out;    
    wire zero;   

    alu uut (
        .a(a),
        .b(b),
        .op(op),
        .out(out),
        .zero(zero)
    );

    initial begin
        $dumpfile("wave.vcd");  // Name of VCD file
        $dumpvars(0, alu_tb);  // Dump all signals in this module

        a = 10; b = 5; op = 3'b000; #10;
        a = 12; b = 12; op = 3'b001; #10;
        a = 32'hF00F; b = 32'h0FF0; op = 3'b010; #10;
        a = 32'h0FF0; b = 32'hF00F; op = 3'b011; #10;
        a = 32'hAAAA; b = 32'h5555; op = 3'b100; #10;
        a = -5; b = 3; op = 3'b101; #10;
        a = 1; b = 4; op = 3'b110; #10;
        a = 8; b = 2; op = 3'b111; #10;

        $finish;
    end

endmodule
