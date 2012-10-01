[bits 32]

section .data

msg: db "Hello World!", 0

section .text

global start
extern puts
extern exit

start:

push msg
call puts
add esp, 4

push 0
call exit
