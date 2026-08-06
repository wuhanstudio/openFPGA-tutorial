# openFPGALoader

```
openFPGALoader -f -b tangnano20k impl/pnr/blinky.fs
```

# nextpnr-himbaechel

```
$ git clone --recursive https://github.com/YosysHQ/nextpnr
$ cd nextpnr
$ mkdir -p build && cd build

$ uv init
$ uv add apycula msgpack cattrs
$ source .venv/bin/activate

$ cmake .. -DARCH="himbaechel" -DHIMBAECHEL_UARCH="gowin" -DPython3_EXECUTABLE=$(which python)
$ make -j$(nproc)
$ sudo make install
```

# Makefile

```
$ uv sync
$ source .venv/bin/activate
$ make flash
```

Apart from the FPGA chip, there is an onboard BL616 chip on this board, wichi provides some built-in commands.

Open the serial port, then use shortcut key `Ctrl + x` and then `Ctrl + c`, press Enter key to open the BL616 inside terminal.

```
TangNano20 /> pll_clk
TangNano20 /> pll_clk O0=24M
TangNano20 /> pll_clk O1=24M
TangNano20 /> pll_clk -s
```
