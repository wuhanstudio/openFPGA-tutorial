TOP := blinky
SRC := src/blinky.v src/divide.v
TB := tb/blinky_tb.v
VCD := tb/blinky_tb.vcd
OUT := tb/blinky_tb.out
PCF := io.pcf
DEVICE ?= up5k
PACKAGE ?= sg48

all: $(TOP).bin

sim: $(OUT)
	vvp $(OUT)

wave: $(VCD)
	gtkwave $(VCD) tb/blinky_tb.gtkw

$(OUT): $(TB) $(SRC)
	iverilog -o $@ $(TB) $(SRC)

$(TOP).json: $(SRC)
	yosys -p "read_verilog $(SRC); synth_ice40 -top $(TOP) -json $@"

$(TOP).asc: $(TOP).json $(PCF)
	nextpnr-ice40 --$(DEVICE) --package $(PACKAGE) --json $< --pcf $(PCF) --asc $@

$(TOP).bin: $(TOP).asc
	icepack $< $@

flash: $(TOP).bin
	icesprog $<

clean:
	$(RM) $(TOP).json $(TOP).asc $(TOP).bin $(OUT) $(VCD)
