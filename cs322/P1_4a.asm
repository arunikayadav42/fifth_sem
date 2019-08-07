.model small
.stack 100h
.data
String1 db "I am a student $"
Length dw $-String1-1
.code
start :
	MOV AX, @data
	MOV DS, AX
	MOV SI, offset String1
	MOV CX, Length
	ADD SI, CX
Back: 	MOV DL, [SI]
	MOV AH, 02H
	INT 21H
	DEC SI
	LOOP Back
	MOV AH, 4CH
	INT 21H
	end start 
.end
