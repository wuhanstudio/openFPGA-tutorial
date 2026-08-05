TOP := blinky
SRC := blinky.v divide.v
LPF := ../projects/lattice/blinky.lpf
DEVICE ?= LCMXO2-4000HC-4MG132C

all: $(TOP).bit

$(TOP).json: $(SRC)
	yosys -p "read_verilog $(SRC); synth_lattice -family xo2 -top $(TOP) -json $@"

$(TOP).config: $(TOP).json $(LPF)
	nextpnr-machxo2 --json $< --lpf $(LPF) --textcfg $@ --device $(DEVICE)

$(TOP).bit: $(TOP).config
	ecppack $< $@

flash: $(TOP).bit
	openFPGALoader $<

clean:
	$(RM) $(TOP).json $(TOP).config $(TOP).bit
