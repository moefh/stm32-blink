
        .include "regs.s"

        .cpu cortex-m3
        .syntax unified
        .thumb

        .text

        @ ======================================
        @ start
        @ ======================================
        .global start
        .thumb_func
start:

        @ copy .data from ROM (flash) to RAM
        ldr     r0, =.data
        ldr     r1, =__data_flash
        ldr     r2, =__data_size
        bl      memcpy
        
        @ enable APB2 clock for port C
        ldr     r0, =0x10                       @ bit 4 = port C
        ldr     r1, =stm32_RCC
        str     r0, [r1, stm32_RCC_APB2ENR]
        ldr     r0, [r1, stm32_RCC_APB2ENR]     @ must delay after enabling any RCC peripheral clock

        @ configure GPIO C pin 13 for output
        ldr     r0, [r1, stm32_GPIOx_CRH]
        bic     r0, r0, #0x00f00000      @ clear 4 bits of pin 13 [0x00f00000 = 0xf << (4*(13-8))]
        orr     r0, r0, #0x00200000      @ set 4 bits of pin 13 (0x2 = push-pull at 2MHz) (0x6 for open-drain instead of push-pull)
        ldr     r1, =stm32_GPIO_PORT_C
        str     r0, [r1, stm32_GPIOx_CRH]

loop:
        @ turn on LED (clear bit 13 in port C ODR) [0x20000000 = 1<<(13+16)]
        ldr     r0, =0x20000000
        str     r0, [r1, stm32_GPIOx_BSRR]
        
        @ delay a bit
        ldr     r3, =delay_amount_on
        ldr     r3, [r3]
        bl      delay

        @ turn off LED (set bit 13 in port C ODR) [0x2000 = 1<<13]
        ldr     r0, =0x2000
        str     r0, [r1, stm32_GPIOx_BSRR]

        @ delay a bit
        ldr     r3, =delay_amount_off
        ldr     r3, [r3]
        bl      delay

        b       loop

start_end:
        .pool
        
        @ ======================================
        @ memcpy
        @ r0 = destination
        @ r1 = source
        @ r2 = length (bytes)
        @ r3 clobbered
        @ ======================================
        .global memcpy
        .thumb_func
memcpy:
        cbz     r2, memcpy_end
memcpy_loop:
        ldrb    r3, [r1], #1
        strb    r3, [r0], #1
        subs    r2, #1
        bne     memcpy_loop
memcpy_end:
        bx      lr

        @ ======================================
        @ delay
        @ r3 = delay amount
        @ ======================================
        .global delay
        .thumb_func
delay:
        subs    r3, r3, #1
        bne     delay
        bx      lr

        @ .data section
        @ This is here just to test the data section copy from ROM to RAM
        .data
delay_amount_on:
        .word   1000000
delay_amount_off:
        .word   300000

