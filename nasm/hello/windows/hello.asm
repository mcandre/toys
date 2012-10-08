[bits 32]

section .data

stdout equ -11
null equ 0

msg db "Hello World!", 13, 10, 0
len equ $-msg

section .bss

dummy resd 1

section .text

global Start
extern GetStdHandle
extern WriteConsoleA
extern ExitProcess

Start:

push stdout
call GetStdHandle

push null
push dummy
push len
push msg
push eax
call WriteConsoleA

push null
call ExitProcess