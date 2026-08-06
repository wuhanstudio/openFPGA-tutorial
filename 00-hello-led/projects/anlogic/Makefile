all:
	@echo Use Anlogic TD to build the project
	@echo Then run 'make flash' to program the device

flash: blinky.bit
	openFPGALoader -b licheeTang  -f blinky.bit
