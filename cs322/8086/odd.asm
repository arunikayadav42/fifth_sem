.model small
.stack 
.data
msg1 db 0dh,0ah,' Number is odd.$'
msg2 DB 0dh,0ah,' Number is even.$'
msg3 DB 0dh,0ah,'Enter the no:$'
.code
.startup
mov ax,@data
mov ds,ax
mov ah,09h
lea dx,msg3
int 21h
mov ah,01h
int 21h
mov bl,al
mov ah,00h
ror ax,01
jc odd
mov ah,09h
lea dx,msg2
int 21h
jmp next
odd:
mov ah,09h
lea dx,msg1
int 21h
next:
.exit
end
