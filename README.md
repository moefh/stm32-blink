# stm32-blink

This is a simple blink example written in assembly for the Blue Pill board (`STM32F103C8T6`).

## Build

To build it, simply

    make

You'll need the `arm-none-eabi` toolchain installed. For Ubuntu:

    sudo apt install binutils-arm-none-eabi gcc-arm-none-eabi gdb-arm-none-eabi

## Run

To upload the program to the board, you need `st-flash`. The Ubuntu
package `stlink-tools` provides one that is too old and doesn't seem to
work with the `STM32F103C8T6`, so you'll need to compile the one from
https://github.com/stlink-org/stlink:

    git clone https://github.com/stlink-org/stlink
    cd stlink
    make
    mkdir -p ~/bin && cp build/Release/bin/st-* ~/bin

After that, you can use this to upload the program to the board:

    sudo ~/bin/st-flash --reset write blink.bin 0x8000000
