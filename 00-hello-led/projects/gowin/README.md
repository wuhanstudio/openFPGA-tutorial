# openFPGALoader

```
openFPGALoader -f -b tangnano20k impl/pnr/blinky.fs
```

# nextpnr-gowin


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
