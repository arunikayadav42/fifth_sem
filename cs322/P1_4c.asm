.model small
.stack 100h
.data
Multiplier dw 8976h
Multiplicant dw 1232h
Product dw ?
.code
start :
	MOV AX, @data
	MOV DS, AX
	MOV AX, Multiplicant
	MUL Multiplier
	MOV Product, AX
	MOV Product+2, DX
	MOV AH, 4CH
	INT 21H
end start
.end
