bits 32

section .data

sys_write equ 4
sys_exit equ 1

stdout equ 1

kernel equ 80h

msg db "Hello World!", 10, 0
len equ $-msg

section .text

global _start

_start:
  mov eax, sys_write
  mov ebx, stdout
  mov ecx, msg
  mov edx, len
  int kernel

  mov eax, sys_exit
  mov ebx, 0
  int kernel
