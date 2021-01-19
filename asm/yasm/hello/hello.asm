[bits 32]

section .data

msg: db "Hello World!", 0

section .text

global main
extern puts
extern exit

main:

push msg
call puts
add esp, 4

push 0
call exit
