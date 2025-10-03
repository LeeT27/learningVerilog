module CPU (
    input clk,
    input reset
);
    wire [6:0] pc; //PC counter that increments by 1 every clock
    wire [31:0] reg_data1, reg_data2, reg_data3, reg_write_data; //Output from reading registers, last one is an input
    wire [31:0] alu_result; //Result of operation
    wire [31:0] instruction; //32 bits of that step
    wire [6:0] jump_address; //Address to move PC value to
    wire [4:0] RAM_address;
    wire [31:0] ram_read_data;
    wire [2:0] alu_op;

    wire [4:0] write_addr;

    wire [4:0] rs; 
    wire [4:0] rt;
    wire [4:0] rd;
    wire [6:0] ls;
    wire [4:0] lt;

    wire [5:0] opcode; //action codenames

    wire reg_write, mem_read, mem_write, jump; //Toggles

    assign opcode = instruction[31:26];
    assign rs     = instruction[25:21];
    assign rt     = instruction[20:16];
    assign rd     = instruction[15:11];

    assign ls = instruction[25:19];
    assign lt = instruction[18:14];

    assign jump_address = instruction[6:0];
    assign write_addr = mem_read ? lt : rd;

    assign reg_write_data = mem_read ? ram_read_data : alu_result;

    PC f1 (
        .clk(clk),
        .reset(reset),
        .jump(jump),
        .jump_address(jump_address),

        .pc(pc)
    );

    ram f2 (
        .clk(clk),
        .write_RAM(mem_write),
        .read_RAM(mem_read),
        .RAM_address(ls),
        .write_data(reg_data3),
        .pc(pc),
        .reset(reset),

        .read_data(ram_read_data),
        .instruction(instruction)
    );

    regfile f3 (
        .clk(clk),
        .reg_write(reg_write),
        .read1_address(rs),
        .read2_address(rt),
        .read3_address(lt),
        .write_address(write_addr),
        .write(reg_write_data),

        .read1(reg_data1),
        .read2(reg_data2),
        .read3(reg_data3)
    );

    alu f4 (
        .a(reg_data1),
        .b(reg_data2),
        .alu_op(alu_op),

        .alu_result(alu_result)
    );

    control f5 (
        .opcode(opcode),

        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .jump(jump),
        .alu_op(alu_op)
    );

endmodule
