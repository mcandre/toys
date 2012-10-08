[bits 32]

section .data

msg db "Hello World!", 10
len equ $-msg

section .text

global start

start:

push len
push msg
push 1		; stdout
mov eax, 4	; sys_write
sub esp, 4	; kernel
int 0x80
add esp, 16	; clean stack (kernel + 4 bytes * 3 arguments)

push 0
mov eax, 1	; sys_exit
sub esp, 4	; kernel
int 0x80