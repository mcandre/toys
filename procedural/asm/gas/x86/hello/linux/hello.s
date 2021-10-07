.global _start

.data

.equ stdout, 1

.equ sys_write, 4
.equ sys_exit, 1

.equ kernel, 0x80

msg: .asciz "Hello World!\n"
.equ len, .-msg

.text

_start:
    mov $sys_write, %eax
    mov $stdout, %ebx
    mov $msg, %ecx
    mov $len, %edx
    int $kernel

    mov $sys_exit, %eax
    mov $0, %ebx
    int $kernel
