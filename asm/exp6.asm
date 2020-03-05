;从键盘输入x和a1、a2、a3
;计算a1sqrt(x)+a2log2(x)+a3sin(x)并将结果打印到屏幕
;当x小于0时，输出信息“Error: x<0!”

DATAS SEGMENT
	NewLine DB 13,10,'$'
	ERRMES DB 'Error: x < 0!',13,10,'$'
	TEN DW 10
	ctrlword DW ?

	BUFFin DB 100 DUP(?)
	BUFFout DB 100 DUP(?)
	TEMP DW ?
	NEGFLAG DW 0
	ARRAY DW 4 DUP(?)
	WHOLE DW 0
	FRACT DW 0
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
	MOV AL, ' '
	STOSB
	MOV AL, '$'
	STOSB

;string to number
	LEA SI, BUFFin
	LEA DI, ARRAY
	MOV CX, 0		;参数个数
	MOV TEMP, 0
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
		.ELSEIF DL == '-'
			.IF CX == 0	;第一个参数x<0
				JMP ERR
			.ELSE
				MOV NEGFLAG, 1
			.ENDIF
			INC SI
			MOV DL, [SI]
		.ELSEIF DL == ' '
			MOV AX, NEGFLAG
			.IF AX == 1
				NEG TEMP
			.ENDIF
			MOV AX, TEMP
			MOV [DI], AX
			ADD DI, 2
			INC CX
			MOV TEMP, 0
			MOV NEGFLAG, 0
			INC SI
			MOV DL, [SI]
		.ENDIF
	.ENDW

;calculate
	FINIT
	LEA SI, ARRAY

	FILD WORD PTR [SI]	;x
	FSQRT			;sqrt(x)
	FILD WORD PTR [SI+2]	;a1
	FMUL			;a1sqrt(x)

	FILD WORD PTR [SI+4]	;a2
	FILD WORD PTR [SI]	;x
	FYL2X			;log2x

	FLDPI			;pi
	FLD1
	FADD ST, ST(0)		;2
	FDIV			;pi/2
	FILD WORD PTR [SI]	;x
	FSUB			;pi/2-x
	FCOS			;cos(pi/2-x)=sin(x)
	FILD WORD PTR [SI+6]	;a3
	FMUL			;a3sin(x)

	FADD
	FADD			;ans

	FSTCW ctrlword
	XOR ctrlword, 0400H
	FLDCW ctrlword		;向下舍入
	FIST WHOLE
	.IF WHOLE>7FFFH
		MOV DL, '-'
		MOV AH, 02H
		INT 21H
		FCHS
		FIST WHOLE
	.ENDIF
	FILD WHOLE		;[ans]
	FSUB			;{ans}

;print whole
	MOV AX, WHOLE
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

	MOV BYTE PTR [DI], '.'
	INC DI

;print fract
	MOV CX, 6
	.WHILE CX>0
		FILD TEN
		FMUL		;{ans}×10
		FIST FRACT	
		FILD FRACT
		FSUB		;{ans}
		MOV AX, FRACT
		ADD AX, 30H
		MOV [DI], AL
		INC DI
		DEC CX
	.ENDW
	MOV BYTE PTR [DI], '$'

;print
	LEA DX, BUFFout
	MOV AH, 09H
	INT 21H

;new line
	LEA DX, NewLine
	MOV AH, 09H
	INT 21H

	JMP STOP
ERR:	LEA DX, ERRMES
	MOV AH, 09H
	INT 21H

;exit
STOP:	MOV  AX, 4C00H
	INT  21H
CODES  ENDS
END   START
