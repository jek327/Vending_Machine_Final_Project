# Vending_Machine_Final_Project

Project Decription:
This project involves designing and implementing a fully functional digital vending machine on an FPGA using Verilog. The machine accepts two types of coin inputs—nickels and dimes—and uses these inputs to update the total amount inserted by the user. The design is built using a modular approach, where each part of the system handles a specific task. A clock divider slows the extremely fast FPGA system clock so that the circuit operates at a speed suitable for human interaction. A pair of debouncer modules clean the mechanical pushbutton signals, ensuring that each press is counted only once. The core of the design is a finite state machine (FSM) that represents the total value inserted in 5-cent steps and determines when to dispense a soda or return change. Once the user reaches 25 cents, the FSM activates the soda output, and if the total reaches 30 cents, it activates both the soda and change outputs. After completing a transaction, the system resets automatically so it can accept a new set of coins. The final design is tested through simulation and on the FPGA board to verify that all state transitions and outputs behave as expected.


Simulation & Implementation Steps:
1) Create testbenches for the FSM and the full vending machine, including a clock signal and different nickel/dime inputs.
2) Run simulations in Vivado to watch the waveforms and check if the states and outputs (s for soda, r for change) change correctly.
3) Fix any mistakes in the code and re-simulate until the machine behaves the way it should for every input.
4) Synthesize and implement the design in Vivado once the simulation looks correct.
5) Program the FPGA board and test the real pushbuttons and LEDs to make sure the hardware matches the simulation results.
