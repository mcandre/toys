bits 32

global main
extern printf

section .data ; writable data

greeting db "hello world",10,0

section .text ; code and read-only data

main:

mov edi, greeting ; first 6 args in edi,esi,edx,ecx,e8,e9 then push from right
call printf
ret