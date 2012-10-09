.globl _start

.data

msg: .asciz "Hello World!\n"
.equ len, .-msg

.equ stdout, 1

.equ sys_write, 4
.equ sys_exit, 1

.equ kernel, 0x80

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
