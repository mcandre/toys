.global _start

.section .rodata

banner: .ascii "Hello World!\n"

.equ banner_len, .-banner
.equ kernel, 0x21
.equ sendrec, 3
.equ fs, 1
.equ mm, 0
.equ write, 0x101
.equ stdout, 1
.equ exit, 0x1
.equ status, 0

.section .data

msg_write:
  .long 0
  .long write
  .long stdout
  .long banner
  .long banner_len
  .long 0
  .space 40

msg_exit:
  .long 0
  .long exit
  .long status
  .space 52

.section .text

_start:
  mov $fs, %eax
  mov $msg_write, %ebx
  mov $sendrec, %ecx
  int $kernel

  mov $mm, %eax
  mov $msg_exit, %ebx
  mov $sendrec, %ecx
  int $kernel
