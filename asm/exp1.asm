;创建一个名为Input1.txt的文件
;使用键盘输入一个包含大写字母、小写字母和数字的字符串，并将这个字符串写入文件中
;读取这个文件，将小写字母转换成大写形式，大写字母和数字保持不变
;最后整个字符串输出到屏幕，并写入Output1.txt文件

DATAS SEGMENT
	INPUT DB  'Input1.txt$', 0
	OUTPUT DB 'Output1.txt$', 0
	ERR DB 'ERR$',13,10
	BUF DB 256 DUP(?)
	CHAR DB 0
	HANDLEin DW ?
	HANDLEout DW ?
DATAS  ENDS

CODES  SEGMENT
	ASSUME    CS:CODES,DS:DATAS

START:
;creat file Input1.txt
	MOV  AX, DATAS
	MOV  DS, AX
	LEA  DX, INPUT
	MOV CX, 0000H
	MOV  AH, 3CH
	INT  21H
; creat judge
	JC STOP
	MOV HANDLEin, AX

;input string
	MOV AX, DATAS
	MOV ES, AX
	CLD
	MOV DI, OFFSET BUF
	MOV CX, 0
	MOV AL, 0
	.WHILE AL != 0DH
		MOV AH, 1
		INT 21H
		STOSB
		ADD CX, 1
	.ENDW
	MOV AL, 0AH
	STOSB
	MOV AL, '$'
	STOSB
	ADD CX, 2

;print string
	MOV AX, DATAS
	MOV DS, AX
	LEA DX, BUF
	MOV AH, 09H
	INT 21H

;write file
	MOV BX, HANDLEin
	MOV AX, DATAS
	MOV DS, AX
	LEA DX, BUF
	MOV AH, 40H
	INT 21H
	JC STOP

;reopen Input1.txt
	MOV BX, HANDLEin
	MOV CX, 0
	MOV DX, 0
	MOV AL, 0
	MOV AH, 42H
	INT 21H
	JC STOP

;creat file Output1.txt
	MOV AX, DATAS
	MOV ES, AX
	LEA  DX, OUTPUT
	MOV CX, 0000H
	MOV  AH, 3CH
	INT  21H
; creat judge
	JC STOP
	MOV HANDLEout, AX

;translate
	MOV AX, DATAS
	MOV DS, AX
	LEA DX, CHAR
	MOV CHAR, 0
	.WHILE CHAR != '$'
		MOV BX, HANDLEin
		MOV CX, 1
		MOV AH, 3FH
		INT 21H
		JC STOP
		.IF CHAR >= 'a' && CHAR <='z'
			SUB CHAR, 20H
		.ENDIF
		MOV BX, HANDLEout
		MOV AH, 40H
		INT 21H
	.ENDW

;reopen Output1.txt
	MOV BX, HANDLEout
	MOV CX, 0
	MOV DX, 0
	MOV AL, 0
	MOV AH, 42H
	INT 21H
	JC STOP

;print caps
	MOV AX, DATAS
	MOV ES, AX
	LEA DX, BUF
	MOV BX, HANDLEout
	MOV CX, 256
	MOV AH, 3FH
	INT 21H
	JC STOP
	MOV AH, 09H
	INT 21H

;close file Output1.txt
	MOV BX, HANDLEout
	MOV AH, 3EH
	INT 21H

;close file Input1.txt
	MOV BX, HANDLEin
	MOV AH, 3EH
	INT 21H

;exit
	MOV  AX, 4C00H
	INT  21H

STOP:	MOV AX, DATAS
	MOV DS, AX
	LEA DX, ERR
	MOV AH, 09H
	INT 21H
CODES  ENDS
END   START
