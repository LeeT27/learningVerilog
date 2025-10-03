**Name:** Ethan Lee  
**Education:** University of Illinois Urbana-Champaign  
**Major:** Computer Engineering  
**Year:** Freshman  

# learningVerilog
This repository documents my journey of self-studying Verilog from the ground up, from combining basic gate modules to creating a **full CPU**. I simulated my work using **Icarus Verilog**, **GTKWave**, and occasionally the **terminal** with custom testbenches. Despite learning Verilog syntax, my primary focus was actually understanding the **digital design principles** behind each project. These projects are intended to showcase my personal learning process and experiences rather than teaching the language to beginners.

With interests in **semiconductor design** and **embedded systems**, I wanted a head start with an **HDL** as the skill is fundamental for both career paths. This foundation would prepare me to design and test larger digital systems in an industry setting, as building them physically eventually becomes too complex.

## [Project 1: AND-OR Logic Circuit](https://github.com/LeeT27/learningVerilog/tree/main/AND-OR%20Logic%20Circuit)
My first Verilog project where I simulated **(A AND B) OR C** in a waveform using basic logic gates

<img width="400" alt="image" src="https://github.com/user-attachments/assets/1c89cbc7-266d-41fd-9b62-3cc2edba1358" /><br>
<img width="600" alt="image" src="https://github.com/user-attachments/assets/6e2d9100-16e8-4d67-875c-3d3085666311" />

**Features and Notes**  
- Simulated **(A AND B) OR C**
  - Initialized logic gate modules (`and_gate`, `or_gate`) with two input ports and one output
  - Created a top module to combine sub-modules to create the corresponding gate logic
- Created a testbench to test every input combination `a`, `b`, and `c`
- Learned to simulate my code using **Icarus Verilog** and analyze waveforms with **GTKWave**
- Generated and analyzed waveform files (`.vcd`) using the terminal to confirm truth table outputs

## [Project 2: 8-Bit RCA](https://github.com/LeeT27/learningVerilog/tree/main/8-Bit%20RCA)
A 8-bit ripple carry adder that computes the sum of two 8-bit inputs, returning a 9-bit output (overflow)

<img width="400" alt="image" src="https://github.com/user-attachments/assets/9c631ae6-4a83-44f6-a4d7-43474585b34a" /><br>
<img width="600" alt="image" src="https://github.com/user-attachments/assets/1fe4ecfe-c4d0-4976-8105-e50a13545cd9" />

**Features and Notes**  
- Made **full adder modules** using **XOR**, **AND**, and **OR** gates, using ripple addition theory
  - If odd # of inputs are 1, the sum bit returns 1
  - If at least two inputs are 1, a 1 is carried out for the next digit
  - Extra wire to hold carry bit data
- Accommodated an **extra bit in the top module output** to handle carry-out and prevent overflow
- Learned to testbench results to the terminal using `$display`
- Learned to initialize **multi-bit inputs, outputs, wires, and registers** e.g. `input [7:0] a;`
- Learned to create loops and multiple instances of modules with keyword `generate`

## [Project 3: 32-Bit 4x8-to-1 MUX](https://github.com/LeeT27/learningVerilog/tree/main/32-Bit%204x8-to-1%20MUX)
A 32-to-1 MUX made up of four smaller 8-to-1 MUX modules with a selection input of 5 bits

<img width="200" alt="image" src="https://github.com/user-attachments/assets/dca9d829-8ace-4a93-bd96-32c121631744" /><br>
<img width="600" alt="image" src="https://github.com/user-attachments/assets/a9a18982-028b-4e24-863b-b243a12701c5" />

**Features and Notes**  
- Made **8-to-1 MUX modules** that each navigate and output one of the **8 bits** using **3 bits**
  - Combined 4 MUX modules that each handle a different byte of the 32-bit input ([31:24], [23:16], [15:8], [7:0])
  - The value of the first three bits [2:0] determine which position to check a bit in each MUX
  - The value of the last two bits [4:3] choose which MUX to return from using the ternary operator
- Learned to use `always @(*)` blocks to ensure outputs are linked to every input change
- Learned to use a **`case` statement** to select which bit of the 8-bit input should be returned corresponding to every 3-bit combination
- Learned to chain **ternary operators `? :`** to select the correct multiplexor based on the last two bits
- Learned to express **multi-bit values**: `<# of bits>'<base><value>` (e.g., `8'h1F`)

## [Project 4: 8-Bit 2x2-to-4 Decoder](https://github.com/LeeT27/learningVerilog/tree/main/8-Bit%202x2-to-4%20Decoder)
An 8-bit 3-to-8 decoder that combines two 2-to-4 decoder modules

<img width="400" alt="image" src="https://github.com/user-attachments/assets/ee7c2d30-7a93-48cf-87fa-a02399f1214e" /><br>
<img width="600" alt="image" src="https://github.com/user-attachments/assets/ce47c8a0-38c5-4af5-a370-1f9959cc8c15" />

**Features and Notes**  
- Made and combined **two 2-to-4 decoder modules**, each producing a 4-bit output based on a 2-bit input
  - The 8-bit output returns `0` in most digits, with a `1` at the position of the input value
  - The first two input bits determine where the single `1` will be in the 4 bits
  - The last input bit, `in[2]`, toggles `EN`, which decides whether the upper or lower decoder is active
  - If the upper decoder is enabled, four 0's are concatenated to the right; if the lower decoder is enabled, four 0's are concatenated to the left
- Learned to **concatenate** values: `{<a>,<b>}`
- Learned to toggle decoders instead of using a ternary operator -> **more organized** code

## [Project 5: 32-Bit ALU](https://github.com/LeeT27/learningVerilog/tree/main/32-Bit%20ALU)
A 32-bit ALU that calculates arithmetic and bitwise operations with a zero indicator

<img width="400" alt="image" src="https://github.com/user-attachments/assets/bd50d2c2-0d0a-48e0-9879-4a08a4ba05aa" /><br>
<img width="600" alt="image" src="https://github.com/user-attachments/assets/e68fabcf-96b8-4443-8f17-9b5d3dd0cfef" />

**Features and Notes**  
- Performs operations with two 32-bit operands
  - The operator is chosen by 3 bits
    - Addition (`000`), subtraction (`001`), bitwise AND (`010`), bitwise OR (`011`), bitwise XOR (`100`), less than (`101`), left shift (`110`), right shift (`111`)
  - **zero flag** returns `1` if the final result equals `0`
- Learned to use **local parameters** to store and name bit values for organization
- Learned to cast an unsigned integer into a signed integer using `$signed(<value>)`
- Gained an understanding of the ALU's role for a CPU
  - Performs operations using register values or inputs
  - Returns results back to registers or memory based off the CPU instructions

## [Project 6: 32x32 Register File](https://github.com/LeeT27/learningVerilog/tree/main/32x32%20Register%20File)
A **32×32** register file that allows for **two reads** and **one write**

<img width="400" alt="image" src="https://github.com/user-attachments/assets/89af7beb-c9c6-4073-96bc-04f284e0fb7d" /><br>
<img width="600" alt="image" src="https://github.com/user-attachments/assets/dc1c8d38-310c-461a-8dfe-1524340297b3" />

**Features and Notes**  
- **32 registers** x **32 bits**: Storage for CPU computation
- **Two read ports**: Read two registers simultaneously with combinational logic
- **One write port**: Writes on a register every rising clock edge (`posedge clk`)
- **5-bit selectors:** Selects register addresses for reading and writing
- **Toggle `reg_write`** to control when to write
- Learned sequential vs combinational logic
  - Combinational: Output always depends on current inputs - any change in the input is immediately reflected in the output
  - Sequential: Output depends on past states and every clock edge takes the current input
  - Used `always @(posedge clk)` to run inner code every rising clock edge
  - Non-blocking assignment (`<=`) so that the inner code occurs in order of the lines, preventing unintended incorrect assignments
- Prevented writing in register `0`
- Gained an understanding of the register's role for a CPU
  - Store temporary values for computations
  - ALU reads registers, performs calculations, and writes back on register or RAM

## [Project 7: 128x32 RAM](https://github.com/LeeT27/learningVerilog/tree/main/128x32%20RAM)
A **128×32** RAM module that allows for **one read** and **one write** per clock cycle

<img width="400" alt="image" src="https://github.com/user-attachments/assets/8234970b-44df-444e-bb82-d814d3ebcb3d" /><br>
<img width="600" alt="image" src="https://github.com/user-attachments/assets/43ec57ad-64f0-4db4-84d5-b076b513bf03" />

**Features and Notes**  
- Similar to the register file, except:
  - Reading is now **synchronous**, therefore reads and writes both occur every rising clock edge
  - One read output instead of two
  - Read and write share the same address input
  - Word `0` can be overwritten
- **128 words** x **32 bits**: Storage for data
- **One read port**: Reads value at selected word every rising clock edge (`posedge clk`)
- **One write port**: Writes on a word every rising clock edge when `write_RAM = 1`
- **7-bit selector**: Selects word address from 0-127
- **Reset** clears memory and output if equal to `1`
- Learned to use **module parameters** to easily adjust word size and the number of words
- Gained an understanding of the RAM's role for a CPU
  - Provides **more** storage than registers to hold **long term** data for programs and instructions
  - Gives **faster** access for the CPU compared to slower storage such as SSD or hard drives
 
## [Project 8: Single-Cycle CPU](https://github.com/LeeT27/learningVerilog/tree/main/Single-Cycle%20CPU)
A **single-cycle CPU** that executes instructions from **128×32** RAM.

<img width="400" alt="image" src="https://github.com/user-attachments/assets/5b968ac1-d5c1-4cb7-8fc7-6b035e04db85" /><br>
<img width="600" alt="image" src="https://github.com/user-attachments/assets/43ec57ad-64f0-4db4-84d5-b076b513bf03" />

**Features and Notes**  
- The top module, **CPU**, combines submodules from previous projects such as the **ALU**, **register file**, and **RAM** + new modules such as the **PC** and **control unit** to perform actions every clock cycle. Here are the submodules:
  - **PC counter** (new): Increments every rising clock edge to cycle through RAM instructions
    - `Reset` input sets PC back to zero 
    - Implemented `always@(posedge reset)` - Resets immediately instead of waiting for rising edge
    - Implemented jump that moves the next instruction to a different PC value
  - **Control unit** (new): Decodes the RAM instruction in order to provide action signals
    - Typical CPU instruction decode format:
      - `[31:26]`: 6-bit opcode chooses type of action
        - **R-type**: Operations in only registers
          - `[25:21]`: 5-bit register 1 address `rs`
          - `[20:16]`: 5-bit register 2 address `rt`
          - `[15:11]`: 5-bit destination register address `rd`
        - **I-type**: Operations in one register and one memory (RAM)
          - `[25:19]`: 7-bit memory address `ls`
          - `[18:14]`: 5-bit register address `lt`
          - (I am aware this deviates from the standard MIPS-style CPU as no offset bits are present, but this is for learning simplicity)
        - **J-type**: Changes PC value
          - `[6:0]`: New PC value `jump_address`
      - Due to different sizes in the RAM and register, bits are assigned differently for R and I type instructions
    - Opcode actions:
      - ADD (`000000`): Adds two registers and writes to a register
      - SUB (`000001`): Subtracts two registers and writes to a register
      - MULT (`000010`): Multiplies two registers and writes to a register
      - DIV (`000011`): Divides two register values and writes to a register
      - LOAD (`000100`): Loads RAM value into register
      - STORE (`000101`): Stores register value into RAM
      - JUMP (`000110`): Changes PC value
      - NOP (`000111`): No operation for one cycle
- The ALU now has multiplication and division
- Learned the full CPU cycle process for one clock cycle
  1. PC increments to RAM instruction
  2. Control unit decodes the 32-bit instruction, determining the action and selecting source/destination registers or RAM addresses
  3. Execution
    - ALU performs arithmetic and logical operations
    - Or data transfers between the RAM and registers
    - Or PC is set to a new value using jump instructions
    - Or no actions occur (NOP)
  4. Results are written back to RAM or register
  5. PC increments to next instruction (+1)
- Testbench initializes all 128 RAM words individually for visual and debugging purposes
  - Words 0 through 63 store instructions
  - Words 64 through 127 store data
### Challenges and Fixes

This project took a **VERY LONG** time to debug and get each instruction action working. Here is a list of the biggest problems that I encountered and fixed when building the CPU.

- My previous projects, specifically the register file and RAM, had different address sizes, 5 and 7 bits, forcing me to work around different bit assignments for R and I type commands.
- RAM reads occurred after the rising clock edge, and therefore would write to the register a tick later than expected. I fixed this by making RAM reading combinational instead of sequential so that RAM data is ready to write in the same clock cycle
- Kept assigning the wrong registers when more than two got involved, leading to unintended calculations (R3,R4,R5,R6,R7,R7)
- Miscounted bits in commands numerous times, leading to accidental bit shifts when assigning opcodes and RAM/register addresses (forgetting a zero at the end)
- When storing a register into RAM, the address kept taking the wrong bits due to the mismatching address sizes, so I had the register take a third address specifically for I type instructions
- I forgot to match instance names in the test bench so referring to RAM values like `cpu.f2.memory[0]` didn't correctly show
- 

### CPU Real World Application: Average Mile Time of a Marathon
#### Prompt:

<img width="200" alt="image" src="https://github.com/user-attachments/assets/3b812f98-fe91-48ba-ac4d-6d2dbd595928" />
<img width="400" alt="image" src="https://github.com/user-attachments/assets/7dfb4285-7e8e-450b-8948-5d54213202db" /><br>
<sub><sup>^ Thats me running the 2024 San Francisco Marathon by the way ;)</sup></sub>  <br><br>

In planet X, Bobby woke up in his hotel to compete in the **26.2 mile Kazoo Park Marathon** that begins in an hour. Unfortunately, his running watch's charging cable broke and all stopwatches in planet X can only measure up to ten minutes at a time. Bobby works around this by having his good friend, Jack, drive to each mile marker and record every mile split on paper. After Bobby finishes the marathon, he asks Jack, "What is my average mile time?" Jack is given a **single-cycle Verilog CPU** (from above) and doesn't know how to write the instructions to calculate the average.

Create a CPU program by editing the RAM instructions to calculate the average mile time of Bobby's marathon and store the result back to the memory
- All the split times in seconds are already written in RAM words 64 through 90
- The last 0.2 mile split is still stored in a whole word.

### Solution
###### 

To do:   
VGA game  
FPGA Implementation
Final project
