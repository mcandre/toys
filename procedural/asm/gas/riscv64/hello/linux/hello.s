.global _start

_start:
    addi a0, x0, 1 # stdout
    la a1, msg
    addi a2, x0, 13
    addi a7, x0, 64 # sys_write
    ecall

    addi a0, x0, 0
    addi a7, x0, 93 # sys_exit
    ecall

.data

msg:
.ascii "Hello World!\n"
