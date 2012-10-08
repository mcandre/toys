[bits 32]

section .data

stdout equ 1

sys_write equ 4
sys_exit equ 1

kernel equ 0x80

msg db "Hello World!", 10
len equ $-msg

section .text

global start

start:

push len
push msg
push stdout
mov eax, sys_write
sub esp, 4
int kernel
add esp, 16	; clean stack (kernel + 4 bytes * 3 arguments)

push 0
mov eax, sys_exit
sub esp, 4
int kernel