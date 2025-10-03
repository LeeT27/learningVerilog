module control(
    input [5:0] opcode,        // instruction opcode
    output reg reg_write,      // write to register file
    output reg mem_read,       // read from RAM
    output reg mem_write,      // write to RAM
    output reg jump,           // jump instruction
    output reg [2:0] alu_op    // ALU operation selector
);

    always @(*) begin
        reg_write = 0;
        mem_read  = 0;
        mem_write = 0;
        jump      = 0;
        alu_op    = 3'b000;

        case(opcode)
            6'b000000: begin // ADD
                reg_write = 1;
                mem_read  = 0;
                mem_write = 0;
                jump      = 0;
                alu_op    = 3'b000;
            end
            6'b000001: begin // SUB
                reg_write = 1;
                mem_read  = 0;
                mem_write = 0;
                jump      = 0;
                alu_op    = 3'b001;
            end
            6'b000010: begin // MULT
                reg_write = 1;
                mem_read  = 0;
                mem_write = 0;
                jump      = 0;
                alu_op    = 3'b010;
            end
            6'b000011: begin // DIV
                reg_write = 1;
                mem_read  = 0;
                mem_write = 0;
                jump      = 0;
                alu_op    = 3'b011;
            end
            6'b000100: begin // LOAD
                reg_write = 1;
                mem_read  = 1;
                mem_write = 0;
                jump      = 0;
                alu_op    = 3'b111;
            end
            6'b000101: begin // STORE
                reg_write = 0;
                mem_read  = 0;
                mem_write = 1;
                jump      = 0;
                alu_op    = 3'b111;
            end
            6'b000110: begin // JUMP
                reg_write = 0;
                mem_read  = 0;
                mem_write = 0;
                jump      = 1;
                alu_op    = 3'b111;
            end
            6'b000111: begin // NOP
                reg_write = 0;
                mem_read  = 0;
                mem_write = 0;
                jump      = 0;
                alu_op    = 3'b111;
            end
            default: begin
                reg_write = 0;
                mem_read  = 0;
                mem_write = 0;
                jump      = 0;
                alu_op    = 3'b111;
            end
        endcase
    end

endmodule
