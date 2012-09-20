.data

msg: .ascii "Hello World!\n\0"

.text

.global _main

_main:

pushl $msg
call _printf

leave
movl $0, %eax
ret
