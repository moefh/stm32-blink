
        .cpu cortex-m3
        .syntax unified
        .thumb

        .section .isr_vector

        @ ======================================
        @ isr_vector
        @ ======================================
        .word __stack_end
        .word start
        .word halt      @ nmi handler
        .word halt      @ hard fault
        .word halt      @ memory fault
        .word halt      @ bus fault
        .word halt      @ usage fault

        @ ======================================
        @ halt
        @ ======================================
        .thumb_func
halt:
        b halt
