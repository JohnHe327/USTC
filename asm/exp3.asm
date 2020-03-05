;从名为“Input3.txt”的文本文件中读取一组数字
;将这些数字从小到大进行排序
;将这些数字按照排序后的次序打印在屏幕上
;数字范围[-1024,1023]，排序数字不超过100个
;排序算法不限

DATAS SEGMENT
	INPUT DB  'Input3.txt$', 0
	HANDLE DW ?

	NewLine DB 10,13,'$'
	SPACE DB ' ','$'

	BUFFin DB 512 DUP(?)
	BUFFout DB 512 DUP(?)
	ARRAY DW 128 DUP(?)
	CNT DW 0
	TEMP DW ?
DATAS  ENDS

STACKS SEGMENT STACK
	DW 100H DUP(0)
STACKS ENDS

CODES  SEGMENT
	ASSUME	CS:CODES, DS:DATAS
START:
	MOV AX, DATAS
	MOV DS, AX

;open Input3.txt
	MOV AH, 3DH
	LEA DX, INPUT
	MOV AL, 0
	INT 21H
	JC STOP
	MOV HANDLE, AX

;input to buffer
	MOV BX, HANDLE
	MOV CX, 512
	LEA DX, BUFFin
	MOV AH, 3FH
	INT 21H
	JC STOP

;string to array
	LEA SI, BUFFin
	LEA DI, ARRAY
	MOV DL, [SI] ;DL=lookahead
	MOV TEMP, 0 ;临时存储输入数字
	MOV CL, 0 ;<0标志
	.WHILE DL != '$'
		.IF DL == ' ' ;读完一个数字
			.IF CL == 1
				NEG TEMP
				MOV CL, 0
			.ENDIF
			MOV DX, TEMP
			MOV [DI], DX
			INC CNT
			ADD DI, 2
			MOV CL, 0
			MOV TEMP, 0
		.ELSEIF DL == '-' ;读入负数
			MOV CL, 1
		.ELSE
			PUSH DX
			MOV AX, 10
			MUL TEMP
			MOV TEMP, AX
			POP DX
			SUB DL, 30H
			MOV DH, 0
			ADD TEMP, DX ;×10+1
		.ENDIF
		INC SI
		MOV DL, [SI]
	.ENDW
	.IF CL == 1
		NEG TEMP
	.ENDIF
	MOV DX, TEMP
	MOV [DI], DX
	INC CNT

;sort
	LEA DI, ARRAY
	ADD DI, CNT
	ADD DI, CNT
	SUB DI, 2 ;[DI]指向最后一个元素
	MOV CX, CNT
	DEC CX ;只需排序cnt-1次
LOOP1:	LEA SI, ARRAY
	.WHILE SI < DI
		MOV AX, [SI]
		MOV BX, [SI+2]
		CMP AX, BX
		JL SKIP
			MOV [SI], BX
			MOV [SI+2], AX
SKIP:		ADD SI, 2
	.ENDW
	LOOPZ LOOP1

;print to bufferout
	LEA SI, ARRAY ;输出[SI]的值
	LEA DI, BUFFout ;存到buffout
	LEA BX, ARRAY
	ADD BX, CNT
	ADD BX, CNT ;BX指向最后一个元素之后
	.WHILE SI < BX
		MOV AX, [SI]
		.IF AX > 7FFFH
			MOV BYTE PTR [DI], '-'
			INC DI
			NEG AX
		.ENDIF
		MOV CX, 0 ;CX=AX位数
		.WHILE AX != 0 ;用栈存各位
			MOV DL, 10
			DIV DL ;AH存个位 AL存其他
			MOV DL, AH
			MOV DH, 0
			PUSH DX
			MOV AH, 0
			INC CX
		.ENDW
		.WHILE CX != 0 ;按位逆序输出到bufferout
			POP AX
			ADD AL, 30H
			MOV [DI], AL
			INC DI
			DEC CX
		.ENDW
		MOV BYTE PTR [DI], ' '
		INC DI
		ADD SI, 2
	.ENDW
	MOV BYTE PTR [DI], 10
	INC DI
	MOV BYTE PTR [DI], 13
	INC DI
	MOV BYTE PTR [DI], '$'
	INC DI

;print to screen
	LEA DX, BUFFout
	MOV AH, 09H
	INT 21H

;close file
	MOV BX, HANDLE
	MOV AH, 3EH
	INT 21H

;exit
STOP:	MOV  AX, 4C00H
	INT  21H
CODES  ENDS
END   START
