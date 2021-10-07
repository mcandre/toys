.global _start

# _start is the entrypoint
_start:
    addi a0, x0, %lo(stdout)
    la a1, msg
    addi a2, x0, %lo(len)
    addi a7, x0, %lo(sys_write)
    ecall

    addi a0, x0, 0
    addi a7, x0, %lo(sys_exit)
    ecall

.section .rodata

.equ stdout, 1
.equ sys_write, 64
.equ sys_exit, 93

msg: .ascii "Hello World!\n"
.equ len, .-msg
