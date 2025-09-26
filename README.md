Name: Ethan Lee  
netID: (ethanjl5)  
UIN: 660582957  

# learningVerilog
Self-studying Verilog, my first HDL, through projects simulated with Icarus Verilog & GTKWave, extending beyond UIUC coursework (Began 9/22/25)

## [Project 1: AND-OR Logic Circuit](https://github.com/LeeT27/learningVerilog/tree/main/AND-OR%20Logic%20Circuit) (9/23/25)
My first Verilog project focused on designing and combining basic logic gates to simulate **(A AND B) OR C** in a waveform for output **y**

<img width="556" height="390" alt="image" src="https://github.com/user-attachments/assets/1c89cbc7-266d-41fd-9b62-3cc2edba1358" />

<img width="1980" height="827" alt="image" src="https://github.com/user-attachments/assets/6e2d9100-16e8-4d67-875c-3d3085666311" />

**Key Features / Learning Outcomes**  
- Simulated **(A AND B) OR C**
- Initialized logic gate modules (`and_gate`, `or_gate`) with two input ports and one output
- Created a top module to combine sub-modules with every input combination
- Configured a testbench to verify correct logic operation
- Learned to simulate Verilog code using **Iverilog** and visualize waveforms with **GTKWave**.
- Generated and analyzed waveform files (`.vcd`) to confirm truth table outputs

## [Project 2: 8-Bit Ripple Carry Adder](https://github.com/LeeT27/learningVerilog/tree/main/8-Bit%20Ripple%20Carry%20Adder%20(RCA)) (9/25/25)
This project implements an 8-bit ripple carry adder that computes the sum of two 8-bit inputs, returning a 9-bit output (including carry-out).

<img width="1704" height="727" alt="image" src="https://github.com/user-attachments/assets/9c631ae6-4a83-44f6-a4d7-43474585b34a" />

<img width="1989" height="1249" alt="image" src="https://github.com/user-attachments/assets/b58d7a90-7d27-4579-b13e-e0d6efc7436b" />

**Key Features / Learning Outcomes**  
- Implemented **full adder modules** using XOR, AND, and OR gates, and learned the theory behind bitwise addition
- Displayed testbench results to the terminal using `$display`
- Learned to initialize **multi-bit inputs, outputs, and wires**
- Learned Verilog **loops** and the `generate` keyword to create multiple instances of `full_adder` at once
- Accommodated an **extra bit in the top module output** to handle carry-out and prevent overflow

## [Project 3: 32-Bit 4x8-to-1 Multiplexer (MUX)](https://github.com/LeeT27/learningVerilog/tree/main/32-Bit%204x8-to-1%20Multiplexer%20(MUX)) (9/25/25)
This project implements a 32-to-1 multiplexer using four 8-to-1 MUX modules, allowing selection of a single bit from a 32-bit input using a 5-bit select line.

<img width="542" height="561" alt="image" src="https://github.com/user-attachments/assets/dca9d829-8ace-4a93-bd96-32c121631744" />

<img width="848" height="469" alt="image" src="https://github.com/user-attachments/assets/90ad01cf-d330-40eb-933c-eac0a670b333" />

**Key Features / Learning Outcomes**  
- Implemented **full adder modules** using XOR, AND, and OR gates, and learned the theory behind bitwise addition
- Displayed testbench results to the terminal using `$display`
- Learned to initialize **multi-bit inputs, outputs, and wires**
- Learned Verilog **loops** and the `generate` keyword to create multiple instances of `full_adder` at once
- Accommodated an **extra bit in the top module output** to handle carry-out and prevent overflow

- 
To do:
Multiplexer  
Decoder
ALU  
CPU components  
Mini CPU  
RAM  
VGA game  
FPGA Implementation
Final project
