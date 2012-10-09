bits 16
jmp start

msg db "Hello World!", 13, 10, 0

%macro biosprint 1 ; A nice wrapper
	mov si, %1
	call puts
%endmacro

; print a string - expects that SI is pointing at our string
puts:
	lodsb
	cmp BYTE al, 0
	je puts_end
		call putc
		jmp puts
	puts_end:
		ret

; print a char to screen - used by puts
putc:
	mov ah, 0x0E
	mov bx, 0x11
	int 0x10
	ret

start:

biosprint msg

; press any key to exit
mov ah, 0x00
int 0x16

times 510 - ($ - $$) db 0
dw 0xaa55
