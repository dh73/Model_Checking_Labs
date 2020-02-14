## Booth Multiplier
The algorithm is described in [here](https://en.wikipedia.org/wiki/Booth%27s_multiplication_algorithm).

## Verilog Version
As discussed in the lab, under `solution_pureverliog_freeversion` is a solution using pure Verilog and the free version of the tool for the sake of comparison.
The Verilog version of the Booth algorithm is a translation of the SystemVerilog model.

## Your Goal
If current state is in `right_shift` and counter is empty, next state should be `idle` in the next clock cycle.
