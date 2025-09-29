Name: Ethan Lee  
netID: (ethanjl5)  
UIN: 660582957  

# learningVerilog
Self-studying Verilog, my first HDL, through projects simulated with Icarus Verilog & GTKWave, extending beyond UIUC coursework (Began 9/22/25)

## [Project 1: AND-OR Logic Circuit](https://github.com/LeeT27/learningVerilog/tree/main/AND-OR%20Logic%20Circuit) (9/23/25)
My first Verilog project focused on designing and combining basic logic gates to simulate **(A AND B) OR C** in a waveform for output **y**

<img width="400" alt="image" src="https://github.com/user-attachments/assets/1c89cbc7-266d-41fd-9b62-3cc2edba1358" />/n
<img width="600" alt="image" src="https://github.com/user-attachments/assets/6e2d9100-16e8-4d67-875c-3d3085666311" />

**Key Features / Learning Outcomes**  
- Simulated **(A AND B) OR C**
  - Initialized logic gate modules (`and_gate`, `or_gate`) with two input ports and one output
  - Created a top module to combine sub-modules to create the corresponding gate logic
- Configured a testbench to verify each input combination `a`, `b`, and `c`
- Learned to simulate Verilog code using **Icarus Verilog** and visualize waveforms with **GTKWave**
- Generated and analyzed waveform files (`.vcd`) using the terminal to confirm truth table outputs

## [Project 2: 8-Bit RCA](https://github.com/LeeT27/learningVerilog/tree/main/8-Bit%20RCA) (9/25/25)
A 8-bit ripple carry adder that computes the sum of two 8-bit inputs, returning a 9-bit output (including carry-out).

<img width="400" alt="image" src="https://github.com/user-attachments/assets/9c631ae6-4a83-44f6-a4d7-43474585b34a" />/n
<img width="600" alt="image" src="https://github.com/user-attachments/assets/1fe4ecfe-c4d0-4976-8105-e50a13545cd9" />

**Key Features / Learning Outcomes**  
- Made **full adder modules** using **XOR**, **AND**, and **OR** gates, and learned the theory behind ripple addition
  - If odd # of inputs are 1, the sum bit returns 1
  - If at least two inputs are 1, a 1 is carried out for the next digit
  - Extra wire to hold carry bit data
- Accommodated an **extra bit in the top module output** to handle carry-out and prevent overflow
- Learned to testbench results to the terminal using `$display`
- Learned to initialize **multi-bit inputs, outputs, wires, and registers** e.g. `input[7:0] a;`
- Learned Verilog **loop** syntax and the `generate` keyword to create multiple instances of `full_adder`

## [Project 3: 32-Bit 4x8-to-1 MUX](https://github.com/LeeT27/learningVerilog/tree/main/32-Bit%204x8-to-1%20MUX) (9/26/25)
A 32-to-1 multiplexer using four 8-to-1 MUX modules that allows for selection of a single bit from a 32-bit input using a 5-bit select line.

<img width="200" alt="image" src="https://github.com/user-attachments/assets/dca9d829-8ace-4a93-bd96-32c121631744" />/n
<img width="600" alt="image" src="https://github.com/user-attachments/assets/a9a18982-028b-4e24-863b-b243a12701c5" />

**Key Features / Learning Outcomes**  
- Made **8-to-1 MUX modules** that output the value of a selected bit from an 8-bit input using a **3-bit select line**
  - Combined 4 of these MUX modules, each handling a different byte of the 32-bit input ([31:24], [23:16], [15:8], [7:0]), to create the 32-to-1 multiplexer
  - The value of the first three bits [2:0] determine which position to check a bit in each MUX
  - The value of the last two bits [4:3] choose which MUX to return from using the ternary operator
- Applied `always @(*)` blocks to ensure outputs automatically update when inputs change
- Used a **`case` statement** so that every 3-bit selector combination corresponds to its correct bit from the 8-bit input
- Learned how to use the **ternary operator `? :`** to select the appropriate multiplexor based on bits [4:3] of the main selection line
  - `<condition> ? <value_if_true> : <value_if_false>` (can be chained)
- Learned how to express **multi-bit values** in binary `b`, hexadecimal `h`, or decimal `d` using the format,
  - `<# of bits>'<base><value>` (e.g., `8'h1F`)

## [Project 4: 8-Bit 2x2-to-4 Decoder](https://github.com/LeeT27/learningVerilog/tree/main/8-Bit%202x2-to-4%20Decoder) (9/26/25)
An 8-bit 3-to-8 decoder that combines two 2-to-4 decoder modules

<img width="400" alt="image" src="https://github.com/user-attachments/assets/ee7c2d30-7a93-48cf-87fa-a02399f1214e" />/n
<img width="600" alt="image" src="https://github.com/user-attachments/assets/ce47c8a0-38c5-4af5-a370-1f9959cc8c15" />

**Key Features / Learning Outcomes**  
- Made and combined **two 2-to-4 decoder modules**, each producing a 4-bit output based on a 2-bit input
  - The 8-bit output returns `0` in most digits, with a `1` at the position corresponding to the decimal value of the input
  - The first two input bits determine whether the output appears in the upper or lower 4 bits, using one decoder or the other
  - The last input bit, `in[2]`, toggles `EN`, which decides whether the upper or lower decoder is active
  - If the upper decoder is enabled, four 0's are concatenated to the end; if the lower decoder is enabled, four 0's are concatenated to the beginning
- Learned to **concatenate** values in Verilog using `{<a>,<b>}`
- Learned to select which decoder to activate with an enable toggle instead of a ternary operator leading to more organized code

## [Project 5: 32-Bit ALU](https://github.com/LeeT27/learningVerilog/tree/main/32-Bit%20ALU) (9/28/25)
A 32-bit Arithmetic Logic Unit (ALU) capable of performing core arithmetic and bitwise operations with a zero flag

<img width="400" alt="image" src="https://github.com/user-attachments/assets/bd50d2c2-0d0a-48e0-9879-4a08a4ba05aa" />/n
<img width="600" alt="image" src="https://github.com/user-attachments/assets/e68fabcf-96b8-4443-8f17-9b5d3dd0cfef" />

**Key Features / Learning Outcomes**  
- Made a **32-bit ALU module** that performs operations on two 32-bit operands based on a 3-bit operator input
  - Supports addition `000`, subtraction `001`, bitwise AND `010`, bitwise OR `011`, bitwise XOR `100`, set on less than `101`, left shift logical `110`, right shift logical `111`
  - `zero` flag returns 1 if the result is 0



To do:  
CPU components  
Mini CPU  
RAM  
VGA game  
FPGA Implementation
Final project
