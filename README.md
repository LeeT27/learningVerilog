Name: Ethan Lee  
netID: (ethanjl5)  
UIN: 660582957  

# learningVerilog
Self-studying Verilog, my first HDL, through projects simulated with Icarus Verilog & GTKWave, extending beyond UIUC coursework (Began 9/22/25)

## [Project 1: AND-OR Logic Circuit](https://github.com/LeeT27/learningVerilog/tree/main/AND-OR%20Logic%20Circuit) (9/23/25)
My first Verilog project focused on designing and combining basic logic gates to simulate **(A AND B) OR C** in a waveform for output **y**

<img width="400" alt="image" src="https://github.com/user-attachments/assets/1c89cbc7-266d-41fd-9b62-3cc2edba1358" />\n
<img width="600" alt="image" src="https://github.com/user-attachments/assets/6e2d9100-16e8-4d67-875c-3d3085666311" />

**Key Features / Learning Outcomes**  
- Simulated **(A AND B) OR C**
- Initialized logic gate modules (`and_gate`, `or_gate`) with two input ports and one output
- Created a top module to combine sub-modules to create the corresponding gate logic
- Configured a testbench to verify each input combination `a`, `b`, and `c`
- Learned to simulate Verilog code using **Icarus Verilog** and visualize waveforms with **GTKWave**
- Generated and analyzed waveform files (`.vcd`) using the terminal to confirm truth table outputs

## [Project 2: 8-Bit Ripple Carry Adder](https://github.com/LeeT27/learningVerilog/tree/main/8-Bit%20Ripple%20Carry%20Adder%20(RCA)) (9/25/25)
This project implements an 8-bit ripple carry adder that computes the sum of two 8-bit inputs, returning a 9-bit output (including carry-out).

<img width="400" alt="image" src="https://github.com/user-attachments/assets/9c631ae6-4a83-44f6-a4d7-43474585b34a" />\n
<img width="600" alt="image" src="https://github.com/user-attachments/assets/1fe4ecfe-c4d0-4976-8105-e50a13545cd9" />

**Key Features / Learning Outcomes**  
- Implemented **full adder modules** using **XOR**, **AND**, and **OR** gates, and learned the theory behind ripple addition
  - If odd # of inputs are 1, the sum bit returns 1
  - If at least two inputs are 1, a 1 is carried out for the next digit
- Accommodated an **extra bit in the top module output** to handle carry-out and prevent overflow
- Learned to testbench results to the terminal using `$display`
- Learned to initialize **multi-bit inputs, outputs, wires, and registers** e.g. `input[7:0] a;`
- Learned Verilog **loop** syntax and the `generate` keyword to create multiple instances of `full_adder`

## [Project 3: 32-Bit 4x8-to-1 Multiplexer (MUX)](https://github.com/LeeT27/learningVerilog/tree/main/32-Bit%204x8-to-1%20Multiplexer%20(MUX)) (9/26/25)
This project implements a 32-to-1 multiplexer using four 8-to-1 MUX modules, allowing selection of a single bit from a 32-bit input using a 5-bit select line.

<img width="200" alt="image" src="https://github.com/user-attachments/assets/dca9d829-8ace-4a93-bd96-32c121631744" />\n
<img width="600" alt="image" src="https://github.com/user-attachments/assets/a9a18982-028b-4e24-863b-b243a12701c5" />

**Key Features / Learning Outcomes**  
- Programmed **8-to-1 MUX modules** that output the value of a selected bit from an 8-bit input using a **3-bit select line**
- Applied `always @(*)` blocks to ensure outputs automatically update when inputs change
- Used a **`case` statement** so that every 3-bit selector combination corresponds to its correct bit from the 8-bit input
- Combined 4 of these MUX modules, each handling a different byte of the 32-bit input ([31:24], [23:16], [15:8], [7:0]), to create the 32-to-1 multiplexer
- Learned how to use the **ternary operater `? :`** to select the appropriate multiplexor based on bits [5:4] of the main selection line
- Learned how to express **multi-bit values** in binary (`b`), hexademical (`h`), or decimal (`d`) using the format, `<# of bits>'<base><value>` (e.g., `8'h1F`)

## [Project 4: 8-Bit 2x2-4 Decoder](https://github.com/LeeT27/learningVerilog/tree/main/8-Bit%202x2-to-4%20Decoder) (9/26/25)
This project implements an 8-bit 3-to-8 decoder that uses two 2-to-4 decoder modules. The first two bits determine the possible output of the upper or lower 4 bits, using one or the other decoder. The last bit, EN, toggles whether the upper or lower decoder is used

<img width="400" alt="image" src="https://github.com/user-attachments/assets/ee7c2d30-7a93-48cf-87fa-a02399f1214e" />\n
<img width="600" alt="image" src="https://github.com/user-attachments/assets/ce47c8a0-38c5-4af5-a370-1f9959cc8c15" />

**Key Features / Learning Outcomes**  
- Built two 2-to-4 decoder modules, each producing a 4-bit output based on a 2-bit input
- The 8-bit output returns all 0's except for a 1 positioned at bit #<decimal_input_value>
- Used the top bit as a toggle to activate either the upper or lower half decoder
- If the upper decoder was enabled, four 0's were concanted to the end, if the bottom was enabled, four 0's were concanted to the beginning
- Learned to concantate two values. e.g. `{<a>,<b>}`
- Able to select decoders through toggle instead of ternary operaters > cleaner and more organized

To do:  
ALU  
Sequential?
CPU components  
Mini CPU  
RAM  
VGA game  
FPGA Implementation
Final project
