all:
	@echo Use Lattice Diamond to build the project
	@echo Then run 'make flash' to program the device

flash: impl1/blinky_impl1.jed
	openFPGALoader -c ft232 -f impl1/blinky_impl1.jed
