section .data

msg: db "Hello World!", 10

section .text

global main
extern printf
extern exit

main:

push msg
call printf
add esp, 4

push 0
call exit
