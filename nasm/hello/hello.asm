section .data

msg: db "Hello World!", 10

section .text

global main
extern printf

main:

push msg
call printf

leave
mov eax, 0
ret
