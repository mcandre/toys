format ELF

public main as 'main'

extrn 'puts' as puts
extrn 'exit' as exit

; code section
section '.text' code readable executable

main:

include 'hello.inc'

section '.data' data readable writeable

_msg db "Hello World!"
