# Lab-2
Computer Architecture Lab Assignment

For this lab, we were instructed to use a finite state machine to detect the sequence 1001.
My detector module has 4 ports. They include clk and rst. There is also an in port which is the input to the sequence detector. The output, found, goes high when the proper sequence is detected.
The module has a 3 bit register to store a current state, and another to store a next state. At the positive edge of the clock, a case satement is used to set the next state with logic from the finite state diagram and based on the input signal.
On the negative edge of the clock, if reset is high, the current state is set back to 0. Otherwise, the current state is set to the next state register which would have been previously assigned on the last positive clock edge.

The testbench tests a series of 1s and 0s designed to test all cases which may cause a false detection. It ends with 2 instances of the sequence and sucesfully recognizes each when simulated.
