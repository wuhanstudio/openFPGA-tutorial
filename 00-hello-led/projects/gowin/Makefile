TOP ?= blinky
SRC := ../../src/blinky.v ../../src/divide.v
CST := src/blinky.cst

YOSYS ?= yosys
YOSYS_FLAGS ?= -setundef

NEXTPNR ?= nextpnr-himbaechel
NEXTPNR_FLAGS ?= --timing-allow-fail -r

DEVICE ?= GW2AR-LV18QN88C8/I7
PART ?= GW2A-18C
FAMILY ?= gw2a

.DEFAULT_GOAL := all

.PHONY: all build flash clean

all: build

build: $(TOP).fs

$(TOP).json: $(SRC)
	$(YOSYS) -D LEDS_NR=6 -D OSC_TYPE_OSC -D INV_BTN=1 -D CPU_FREQ=27 -D BAUD_RATE=115200 -D NUM_HCLK=5 -D RISCV_MEM_88K -p "read_verilog $^; synth_gowin -json $@ -family $(FAMILY) $(YOSYS_FLAGS)"

$(TOP).pack.json: $(TOP).json $(CST)
	$(NEXTPNR) $(NEXTPNR_FLAGS) --json $< --write $@ --device $(DEVICE) --vopt family=$(PART) --vopt cst=$(CST)

$(TOP).fs: $(TOP).pack.json
	gowin_pack -c -d $(PART) -o $@ $<

flash: $(TOP).fs
	openFPGALoader -f -b tangnano20k $<

clean:
	$(RM) $(TOP).json $(TOP).pack.json $(TOP).fs
