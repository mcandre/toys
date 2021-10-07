.global _start

_start:
    addi a0, x0, %lo(stdout)
    la a1, msg
    addi a2, x0, %lo(len)
    addi a7, x0, 64 # sys_write
    ecall

    addi a0, x0, 0
    addi a7, x0, 93 # sys_exit
    ecall

.section .rodata

.equ stdout, 1

msg: .ascii "Hello World!\n"
.equ len, .-msg
