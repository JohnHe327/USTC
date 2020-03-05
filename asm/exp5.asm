;编程计算任一整数加减运算表达式
;表达式从键盘输入，可带括号
;表达式的长度不超过1024个字节
;表达式示例：15-(4-2)

DATAS SEGMENT
	NewLine DB 13,10,'$'
	TEN DW 10

	BUFFin DB 100 DUP(?)
	BUFFout DB 100 DUP(?)
	TEMP DW ?
	FLAG DB 0
DATAS  ENDS

STACKS SEGMENT STACK
	DW 100H DUP (0)
STACKS ENDS

CODES  SEGMENT
	ASSUME	CS:CODES, DS:DATAS

START:
	MOV AX, DATAS
	MOV DS, AX

;input string
	MOV AX, DATAS
	MOV ES, AX
	CLD
	LEA DI, BUFFin
	MOV CX, 0
	MOV AH, 01H
	INT 21H
	.WHILE AL != 13
		STOSB
		INC CX
		MOV AH, 01H
		INT 21H
	.ENDW
	MOV AL, '$'
	STOSB

;string to number
	LEA SI, BUFFin
	MOV TEMP, 0
	PUSH TEMP
	MOV DL, '+'
	MOV DH, 0
	PUSH DX
	MOV FLAG, 1
	MOV DL, [SI]		;DL=lookahead
	.WHILE DL != '$'
		.IF DL >= 30H && DL <= 39H
			MOV AX, TEMP
			MUL TEN
			MOV TEMP, AX
			MOV DL, [SI]
			SUB DL, 30H
			MOV DH, 0
			ADD TEMP, DX
			INC SI
			MOV DL, [SI]
		.ELSEIF DL == '+' || DL == '-'
			MOV AL, FLAG
			.IF AL == 0
				PUSH TEMP
				MOV TEMP, 0
				MOV DH, 0
				PUSH DX
				MOV FLAG, 1
			.ELSE
				POP BX
				POP AX
				.IF BL == '+'
					ADD AX, TEMP
					PUSH AX
					MOV TEMP, 0
				.ELSEIF BL == '-'
					SUB AX, TEMP
					PUSH AX
					MOV TEMP, 0
				.ENDIF
				MOV DH, 0
				PUSH DX
			.ENDIF
			INC SI
			MOV DL, [SI]
		.ELSEIF DL == '('
			MOV DH, 0
			PUSH DX
			MOV FLAG, 0
			INC SI
			MOV DL, [SI]
		.ELSEIF DL == ')'
			POP BX
			POP AX
			.IF BL == '+'
				ADD AX, TEMP
				POP DX
				MOV TEMP, AX
			.ELSEIF BL == '-'
				SUB AX, TEMP
				POP DX
				MOV TEMP, AX
			.ENDIF
			MOV FLAG, 1
			INC SI
			MOV DL, [SI]
		.ENDIF
	.ENDW

	MOV AL, FLAG
	.IF AL == 1
		POP BX
		POP AX
		.IF BX == '+'
			ADD AX, TEMP
		.ELSE
			SUB AX, TEMP
		.ENDIF
	.ELSE
		MOV AX, TEMP
	.ENDIF

;print to bufferout
	LEA DI, BUFFout
	MOV CX, 0
	.IF AX == 0
		MOV BYTE PTR [DI], 30H
		INC DI
	.ELSE
		.WHILE AX != 0
			MOV DX, 0
			DIV TEN
			PUSH DX
			INC CX
		.ENDW
		.WHILE CX != 0
			POP AX
			ADD AL, 30H
			MOV [DI], AL
			INC DI
			DEC CX
		.ENDW
	.ENDIF
	MOV BYTE PTR [DI], '$'

;print
	LEA DX, BUFFout
	MOV AH, 09H
	INT 21H

;new line
	LEA DX, NewLine
	MOV AH, 09H
	INT 21H

;exit
STOP:	MOV  AX, 4C00H
	INT  21H
CODES  ENDS
END   START
