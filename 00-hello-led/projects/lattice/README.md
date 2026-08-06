# openFPGALoader

```
sudo apt install openfpgaloader
```

Scan USB devices:

```
$openFPGALoader --scan-usb

found 6 USB device
Bus device vid:pid       probe type      manufacturer serial               product
003 015    0x0403:0x6014 ft232H          FTDI         none                 Single RS232-HS
```

Scan FPGA boards:

```
$ openFPGALoader -c ft232 --detect

Can't read iSerialNumber field from FTDI: considered as empty string
Jtag frequency : requested 6.00MHz   -> real 6.00MHz  
index 0:
	idcode 0x12bc043
	manufacturer lattice
	family MachXO2
	model  LCMXO2-4000HC
	irlength 8
```

Upload the firmware to FLASH:
```
openFPGALoader -c ft232 -f impl1/blinky_impl1.jed
```
