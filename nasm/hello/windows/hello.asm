[bits 32]

section .data

msg db "Hello World!", 13, 10, 0
len equ $-msg

section .bss

buf resd 1

section .text

global Start
extern GetStdHandle
extern WriteConsoleA
extern ExitProcess

Start:

push -11			; get stdout
call GetStdHandle

push 0				; null
push buf			; [chars written]
push len
push msg
push eax			; stdout
call WriteConsoleA

push 0
call ExitProcess