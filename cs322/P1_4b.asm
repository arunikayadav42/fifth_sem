.model small
.stack
print macro q
lea dx,q
mov ah,09h
int 21h
endm
.data
.code
start:
	mov dl,30h
	mov ah,02h
	int 21h
	mov dl,31h
	mov ah,02h
	int 21h
	mov bh,00h
	mov bl,01h
	mov cx,05
l:	mov dh,bl
	add bl,bh
	mov bh,dh
	mov dl,bl
	add dl,30h
	mov ah,02h
	int 21h
	loop l
end start
.end

