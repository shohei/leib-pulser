PROGRAM = pulser

all:
	iverilog -o $(PROGRAM).vvp $(PROGRAM).v $(PROGRAM)_tb.v && vvp $(PROGRAM).vvp && open $(PROGRAM).vcd
